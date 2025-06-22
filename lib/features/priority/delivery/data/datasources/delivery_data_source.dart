import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/dispatched_delivery_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_order.dart';

abstract class DeliveryDataSource {
  Future<List<PendingOrder>> getPendingDeliveryOrders();
  Future<PendingOrder> getPendingDeliveryOrdersById(String id);
  Future<List<PriorityDeliveryOrder>> getPriorityDeliveryOrders();
  Future<PriorityDeliveryOrder> getPriorityDeliveryOrdersById(String id);
  Future<List<DispatchedDeliveryOrder>> getDispatchDeliveryOrders();
  Future<DispatchedDeliveryOrder> getDispatchDeliveryOrdersById(String id);
  Future<List<DispatchedDeliveryOrder>> getDispatchDeliveryOrdersByDate(
      String date);
  Future<bool> addDeliveryPriority(List<String> orderIds, bool asTruck);
  Future<bool> deleteDeliveryPriority(List<String> orderIds);
  Future<bool> dispatchDeliveryOrders(List<String> orders, String agent);
  Future<bool> undispatchDeliveryOrders(List<String> orders);
  Future<List<String>> getDispatchAgents();
}

class DeliveryDataSourceImpl extends DeliveryDataSource {
  final ApiService apiService;

  DeliveryDataSourceImpl({required this.apiService});

  @override
  Future<bool> addDeliveryPriority(List<String> orderIds, bool asTruck) async {
    var data = {
      "orders": orderIds,
      "asTruck": asTruck,
    };
    var result = await apiService.put(
      endPoint: 'api/DeliveryPriorityOrders/MakeOrderPriorityFromPending',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> deleteDeliveryPriority(List<String> orderIds) async {
    var result = await apiService.put(
      endPoint: 'api/DeliveryPriorityOrders/MakeOrderPendingFromPriority',
      data: {
        "orders": orderIds,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  // @override
  // Future<bool> dispatchDeliveryOrders(
  //     List<DispatchDeliveryEntity> orders) async {
  //   var result = await apiService.put(
  //     endPoint: 'api/DeliveryPriorityOrders/MakeOrderDispatchFromPriority',
  //     data: {
  //       "orders": orders.map((e) => e.toJson()).toList(),
  //     },
  //   );
  //   bool successed = result["data"] as bool;
  //   return successed;
  // }

  @override
  Future<bool> dispatchDeliveryOrders(List<String> orders, String agent) async {
    var result = await apiService.put(
      endPoint: 'api/DeliveryPriorityOrders/MakeOrderDispatchFromPriority',
      data: {
        "orders": orders,
        "dispatchAgent": agent,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<List<DispatchedDeliveryOrder>> getDispatchDeliveryOrders() async {
    var result =
        await apiService.get(endPoint: 'api/DeliveryDispatchOrders/GetAll');
    List<DispatchedDeliveryOrder> dispatchDeliveryOrders = [];
    for (var order in result["data"]) {
      dispatchDeliveryOrders.add(DispatchedDeliveryOrder.fromJson(order));
    }
    return dispatchDeliveryOrders;
  }

  @override
  Future<List<DispatchedDeliveryOrder>> getDispatchDeliveryOrdersByDate(
      String date) async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryDispatchOrders/GetAllByDate?date=$date',
    );
    List<DispatchedDeliveryOrder> dispatchDeliveryOrders = [];
    for (var order in result["data"]) {
      dispatchDeliveryOrders.add(DispatchedDeliveryOrder.fromJson(order));
    }
    return dispatchDeliveryOrders;
  }

  @override
  Future<DispatchedDeliveryOrder> getDispatchDeliveryOrdersById(
      String id) async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryDispatchOrders/GetDispatchOrder?$id',
    );
    DispatchedDeliveryOrder dispatchDeliveryOrder =
        DispatchedDeliveryOrder.fromJson(result["data"]);
    return dispatchDeliveryOrder;
  }

  @override
  Future<List<PendingOrder>> getPendingDeliveryOrders() async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryPendingOrders/GetAll',
    );
    List<PendingOrder> pendingOrders = [];
    for (var order in result["data"]) {
      pendingOrders.add(PendingOrder.fromJson(order));
    }
    return pendingOrders;
  }

  @override
  Future<PendingOrder> getPendingDeliveryOrdersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryPendingOrders/GetPendingOrder?$id',
    );
    PendingOrder pendingOrder = PendingOrder.fromJson(result["data"]);
    return pendingOrder;
  }

  @override
  Future<List<PriorityDeliveryOrder>> getPriorityDeliveryOrders() async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryPriorityOrders/GetAll',
    );
    List<PriorityDeliveryOrder> priorityDeliveryOrders = [];
    for (var order in result["data"]) {
      priorityDeliveryOrders.add(PriorityDeliveryOrder.fromJson(order));
    }
    return priorityDeliveryOrders;
  }

  @override
  Future<PriorityDeliveryOrder> getPriorityDeliveryOrdersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/DeliveryPriorityOrders/GetPriorityOrder?$id',
    );
    PriorityDeliveryOrder priorityDeliveryOrder =
        PriorityDeliveryOrder.fromJson(result["data"]);
    return priorityDeliveryOrder;
  }

  @override
  Future<bool> undispatchDeliveryOrders(List<String> orders) async {
    var data = {
      "orders": orders,
      "asTruck": false,
    };
    var result = await apiService.put(
      endPoint: 'api/DeliveryPriorityOrders/MakeOrderPriorityFromDispatch',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<List<String>> getDispatchAgents() async {
    var result =
        await apiService.get(endPoint: 'api/Selectors/GetAllDispatchAgents');
    List<String> agents = [];
    for (var item in result["data"]) {
      agents.add(item["name"] as String);
    }
    return agents;
  }
}

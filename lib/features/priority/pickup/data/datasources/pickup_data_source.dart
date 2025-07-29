import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';

abstract class PickupDataSource {
  Future<List<PendingOrder>> getPendingPickupOrders();
  Future<PendingOrder> getPendingPickupOrdersById(String id);
  Future<List<PriorityPickupOrder>> getPriorityPickupOrders();
  Future<PriorityPickupOrder> getPriorityPickupOrdersById(String id);
  Future<DispatchPickupOrder> getDispatchPickupOrdersById(String id);
  Future<List<DispatchPickupOrder>> getDispatchPickupOrdersByDate(String date);
  Future<bool> addPickupPriority(List<String> orderIds);
  Future<bool> deletePickupPriority(List<String> orderIds);
  Future<bool> dispatchPickupOrders(List<String> orders);
  Future<bool> undispatchPickupOrders(List<String> orders);
}

class PickupDataSourceImpl extends PickupDataSource {
  final ApiService apiService;

  PickupDataSourceImpl({required this.apiService});

  @override
  Future<bool> addPickupPriority(List<String> orderIds) async {
    var data = {
      "orders": orderIds,
    };
    var result = await apiService.put(
      endPoint: 'api/PickupPriorityOrders/MakeOrderPriorityFromPending',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> deletePickupPriority(List<String> orderIds) async {
    var result = await apiService.put(
      endPoint: 'api/PickupPriorityOrders/MakeOrderPendingFromPriority',
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
  Future<bool> dispatchPickupOrders(List<String> orders) async {
    var result = await apiService.put(
      endPoint: 'api/PickupPriorityOrders/MakeOrderDispatchFromPriority',
      data: {
        "orders": orders,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<List<DispatchPickupOrder>> getDispatchPickupOrdersByDate(
      String date) async {
    var result = await apiService.get(
      endPoint: 'api/PickupDispatchOrders/GetAllByDate?date=$date',
    );
    List<DispatchPickupOrder> dispatchPickupOrders = [];
    for (var order in result["data"]) {
      dispatchPickupOrders.add(DispatchPickupOrder.fromJson(order));
    }
    return dispatchPickupOrders;
  }

  @override
  Future<DispatchPickupOrder> getDispatchPickupOrdersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/PickupDispatchOrders/GetDispatchOrder?$id',
    );
    DispatchPickupOrder dispatchPickupOrder =
        DispatchPickupOrder.fromJson(result["data"]);
    return dispatchPickupOrder;
  }

  @override
  Future<List<PendingOrder>> getPendingPickupOrders() async {
    var result = await apiService.get(
      endPoint: 'api/PickupPendingOrders/GetAll',
    );
    List<PendingOrder> pendingOrders = [];
    for (var order in result["data"]) {
      pendingOrders.add(PendingOrder.fromJson(order));
    }
    return pendingOrders;
  }

  @override
  Future<PendingOrder> getPendingPickupOrdersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/PickupPendingOrders/GetPendingOrder?$id',
    );
    PendingOrder pendingOrder = PendingOrder.fromJson(result["data"]);
    return pendingOrder;
  }

  @override
  Future<List<PriorityPickupOrder>> getPriorityPickupOrders() async {
    var result = await apiService.get(
      endPoint: 'api/PickupPriorityOrders/GetAll',
    );
    List<PriorityPickupOrder> priorityPickupOrders = [];
    for (var order in result["data"]) {
      priorityPickupOrders.add(PriorityPickupOrder.fromJson(order));
    }
    return priorityPickupOrders;
  }

  @override
  Future<PriorityPickupOrder> getPriorityPickupOrdersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/PickupPriorityOrders/GetPriorityOrder?$id',
    );
    PriorityPickupOrder priorityPickupOrder =
        PriorityPickupOrder.fromJson(result["data"]);
    return priorityPickupOrder;
  }

  @override
  Future<bool> undispatchPickupOrders(List<String> orders) async {
    var data = {
      "orders": orders,
    };
    var result = await apiService.put(
      endPoint: 'api/PickupPriorityOrders/MakeOrderPriorityFromDispatch',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }
}

import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryDataSource {
  Future<List<OrderResponse>> getPendingDeliveryOrders();
  // Future<PendingOrder> getPendingDeliveryOrdersById(String id);
  Future<List<OrderResponse>> getPriorityDeliveryOrders();
  // Future<PriorityDeliveryOrder> getPriorityDeliveryOrdersById(String id);
  // Future<List<DispatchedDeliveryOrder>> getDispatchDeliveryOrders(Order order);
  // Future<DispatchedDeliveryOrder> getDispatchDeliveryOrdersById(String id);
  Future<List<OrderResponse>> getDispatchDeliveryOrdersByDate(
      String date);
  Future<bool> makeDeliveryPriority(List<String> orderIds, bool asTruck);
  Future<bool> makeDeliveryPending(List<String> orderIds);
  Future<bool> dispatchDeliveryOrders(List<DispatchDeliveryEntity> orders);
  // Future<bool> undispatchDeliveryOrders(List<String> orders);
  Future<List<String>> getDispatchAgents();
}

class DeliveryDataSourceImpl extends DeliveryDataSource {
  final ApiService apiService;

  DeliveryDataSourceImpl({required this.apiService});

  @override
  Future<bool> makeDeliveryPriority(List<String> orderIds, bool asTruck) async {
    var data = {
      "orders": orderIds,
      "asTruck": asTruck,
    };
    var result = await apiService.put(
      endPoint: 'api/Orders/MakePriority',
      data: data,
    );
    bool successed = result["data"]["data"] as bool;
    return successed;
  }

  @override
  Future<bool> makeDeliveryPending(List<String> orderIds) async {
    var result = await apiService.put(
      endPoint: 'api/Orders/MakePending',
      data: {
        "orders": orderIds,
      },
    );
    bool successed = result["data"]["data"] as bool;
    return successed;
  }

  @override
  Future<bool> dispatchDeliveryOrders(
    List<DispatchDeliveryEntity> orders,
  ) async {
    var result = await apiService.put(
      endPoint: 'api/Orders/MakeDispatch',
      data: {
        "orders": orders
            .map((o) => {
                  "id": o.id,
                  "dispatcher": o.agentName,
                })
            .toList(),
      },
    );
    bool successed = result["data"]["data"] as bool;
    return successed;
  }



  @override
  Future<List<OrderResponse>> getDispatchDeliveryOrdersByDate(
      String date) async {
    var result = await apiService.get(
        endPoint:
            'api/Orders/Search?FromDate=$date&ToDate=$date&Status=2&DispatchChannel=Delivery');
    List<OrderResponse> dispatchDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      dispatchDeliveryOrders.add(OrderResponse.fromJson(order));
    }
    return dispatchDeliveryOrders;
  }


  @override
  Future<List<OrderResponse>> getPendingDeliveryOrders() async {
    var result = await apiService.get(
        endPoint:
            'api/Orders/Search?Status=0&DispatchChannel=Delivery');
    List<OrderResponse> pendingDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      pendingDeliveryOrders.add(OrderResponse.fromJson(order));
    }
    return pendingDeliveryOrders;
  }

  // @override
  // Future<PendingOrder> getPendingDeliveryOrdersById(String id) async {
  //   var result = await apiService.get(
  //     endPoint: 'api/DeliveryPendingOrders/GetPendingOrder?$id',
  //   );
  //   PendingOrder pendingOrder = PendingOrder.fromJson(result["data"]);
  //   return pendingOrder;
  // }

  @override
  Future<List<OrderResponse>> getPriorityDeliveryOrders() async {
    var result = await apiService.get(
      endPoint: 'api/Orders/Search?Status=1&DispatchChannel=Delivery',
    );
    List<OrderResponse> priorityDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      priorityDeliveryOrders.add(OrderResponse.fromJson(order));
    }
    return priorityDeliveryOrders;
  }

  // @override
  // Future<PriorityDeliveryOrder> getPriorityDeliveryOrdersById(String id) async {
  //   var result = await apiService.get(
  //     endPoint: 'api/DeliveryPriorityOrders/GetPriorityOrder?$id',
  //   );
  //   PriorityDeliveryOrder priorityDeliveryOrder =
  //       PriorityDeliveryOrder.fromJson(result["data"]);
  //   return priorityDeliveryOrder;
  // }

  // @override
  // Future<bool> undispatchDeliveryOrders(List<String> orders) async {
  //   var data = {
  //     "orders": orders,
  //     "asTruck": false,
  //   };
  //   var result = await apiService.put(
  //     endPoint: 'api/DeliveryPriorityOrders/MakeOrderPriorityFromDispatch',
  //     data: data,
  //   );
  //   bool successed = result["data"] as bool;
  //   return successed;
  // }

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

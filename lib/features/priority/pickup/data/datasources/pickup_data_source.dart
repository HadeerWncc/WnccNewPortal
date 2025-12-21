import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';

abstract class PickupDataSource {
  Future<List<OrderResponse>> getPendingPickupOrders();
  // Future<PendingOrder> getPendingPickupOrdersById(String id);
  Future<List<OrderResponse>> getPriorityPickupOrders();
  // Future<PriorityPickupOrder> getPriorityPickupOrdersById(String id);
  // Future<DispatchPickupOrder> getDispatchPickupOrdersById(String id);
  Future<List<OrderResponse>> getDispatchPickupOrdersByDate(String date);
  Future<bool> priorityPickupOrder(List<String> orderIds);
  Future<bool> pendingPickupOrder(List<String> orderIds);
  Future<bool> dispatchPickupOrders(List<String> orders);
  // Future<bool> undispatchPickupOrders(List<String> orders);
}

class PickupDataSourceImpl extends PickupDataSource {
  final ApiService apiService;

  PickupDataSourceImpl({required this.apiService});

  @override
  Future<bool> priorityPickupOrder(List<String> orderIds) async {
    var data = {
      "orders": orderIds,
    };
    var result = await apiService.put(
      endPoint: 'api/Orders/MakePriority',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> pendingPickupOrder(List<String> orderIds) async {
    var result = await apiService.put(
      endPoint: 'api/Orders/MakePending',
      data: {
        "orders": orderIds,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> dispatchPickupOrders(List<String> orders) async {
    var result = await apiService.put(
      endPoint: 'api/Orders/MakeDispatch',
      data: {
        "orders": orders
            .map((o) => {
                  "id": o,
                  "dispatcher": "",
                })
            .toList(),
        
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<List<OrderResponse>> getDispatchPickupOrdersByDate(
      String date) async {
    var result = await apiService.get(
      endPoint: 'api/Orders/Search?FromDate=$date&ToDate=$date&Status=2&DispatchChannel=Pickup',
    );
    List<OrderResponse> dispatchPickupOrders = [];
    for (var order in result["data"]["data"]) {
      dispatchPickupOrders.add(OrderResponse.fromJson(order));
    }
    return dispatchPickupOrders;
  }

  // @override
  // Future<DispatchPickupOrder> getDispatchPickupOrdersById(String id) async {
  //   var result = await apiService.get(
  //     endPoint: 'api/PickupDispatchOrders/GetDispatchOrder?$id',
  //   );
  //   DispatchPickupOrder dispatchPickupOrder =
  //       DispatchPickupOrder.fromJson(result["data"]);
  //   return dispatchPickupOrder;
  // }

  @override
  Future<List<OrderResponse>> getPendingPickupOrders() async {
    var result = await apiService.get(
      endPoint: 'api/Orders/Search?Status=0&DispatchChannel=Pickup',
    );
    List<OrderResponse> pendingOrders = [];
    for (var order in result["data"]["data"]) {
      pendingOrders.add(OrderResponse.fromJson(order));
    }
    return pendingOrders;
  }

  // @override
  // Future<PendingOrder> getPendingPickupOrdersById(String id) async {
  //   var result = await apiService.get(
  //     endPoint: 'api/PickupPendingOrders/GetPendingOrder?$id',
  //   );
  //   PendingOrder pendingOrder = PendingOrder.fromJson(result["data"]);
  //   return pendingOrder;
  // }

  @override
  Future<List<OrderResponse>> getPriorityPickupOrders() async {
    var result = await apiService.get(
      endPoint: 'api/Orders/Search?Status=1&DispatchChannel=Pickup',
    );
    List<OrderResponse> priorityPickupOrders = [];
    for (var order in result["data"]["data"]) {
      priorityPickupOrders.add(OrderResponse.fromJson(order));
    }
    return priorityPickupOrders;
  }

  // @override
  // Future<PriorityPickupOrder> getPriorityPickupOrdersById(String id) async {
  //   var result = await apiService.get(
  //     endPoint: 'api/PickupPriorityOrders/GetPriorityOrder?$id',
  //   );
  //   PriorityPickupOrder priorityPickupOrder =
  //       PriorityPickupOrder.fromJson(result["data"]);
  //   return priorityPickupOrder;
  // }

  // @override
  // Future<bool> undispatchPickupOrders(List<String> orders) async {
  //   var data = {
  //     "orders": orders,
  //   };
  //   var result = await apiService.put(
  //     endPoint: 'api/PickupPriorityOrders/MakeOrderPriorityFromDispatch',
  //     data: data,
  //   );
  //   bool successed = result["data"] as bool;
  //   return successed;
  // }
}

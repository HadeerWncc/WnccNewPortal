import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryDataSource {
  Future<List<PriorityDeliveryModel>> getPendingDeliveryOrders();
  Future<List<PriorityDeliveryModel>> getPriorityDeliveryOrders();
  Future<List<PriorityDeliveryModel>> getDispatchDeliveryOrdersByDate(
      String date);
  Future<bool> makeDeliveryPriority(List<String> orderIds, bool asTruck,
      int prioritySource, DateTime? priorityDate);
  Future<bool> makeDeliveryPending(List<String> orderIds);
  Future<bool> dispatchDeliveryOrders(List<DispatchDeliveryEntity> orders);
  Future<List<DispatchDeliveryEntity>> getDispatchAgents();
  Future<PrioritySummaryModel> getDeliverySummary(
      GetSummaryEntity getpicSummaryEntity);
  Future<bool> addNewDispatcher(String dispatcher);
  Future<bool> editDispatcherName(String dispatcherId, String dispatcherName);
  Future<bool> deleteDispatchers(List<String> dispatchers);
}

class DeliveryDataSourceImpl extends DeliveryDataSource {
  final ApiService apiService;

  DeliveryDataSourceImpl({required this.apiService});

  @override
  Future<bool> makeDeliveryPriority(List<String> orderIds, bool asTruck,
      int prioritySource, DateTime? priorityDate) async {
    var data = {
      "orders": orderIds,
      "source": prioritySource,
      "asTruck": asTruck,
      "date": (priorityDate ?? DateTime.now()).toIso8601String(),
    };
    var result = await apiService.put(
      endPoint: 'api/Delivery/MakePriority',
      data: data,
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> makeDeliveryPending(List<String> orderIds) async {
    var result = await apiService.put(
      endPoint: 'api/Delivery/MakePending',
      data: {
        "orders": orderIds,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> dispatchDeliveryOrders(
    List<DispatchDeliveryEntity> orders,
  ) async {
    var result = await apiService.put(
      endPoint: 'api/Delivery/MakeDispatch',
      data: {
        "orders": orders
            .map((o) => {
                  "id": o.id,
                  "dispatcher": o.agentName,
                })
            .toList(),
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<List<PriorityDeliveryModel>> getDispatchDeliveryOrdersByDate(
      String date) async {
    var result = await apiService.get(
        endPoint: 'api/Delivery/Search?FromDate=$date&ToDate=$date&Status=2');
    List<PriorityDeliveryModel> dispatchDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      dispatchDeliveryOrders.add(PriorityDeliveryModel.fromJson(order));
    }
    return dispatchDeliveryOrders;
  }

  @override
  Future<List<PriorityDeliveryModel>> getPendingDeliveryOrders() async {
    var result = await apiService.get(
        endPoint: 'api/Delivery/Search?Status=0&PageNumber=1&PageSize=5000');
    List<PriorityDeliveryModel> pendingDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      pendingDeliveryOrders.add(PriorityDeliveryModel.fromJson(order));
    }
    return pendingDeliveryOrders;
  }

  @override
  Future<List<PriorityDeliveryModel>> getPriorityDeliveryOrders() async {
    var result = await apiService.get(
      endPoint: 'api/Delivery/Search?Status=1',
    );
    List<PriorityDeliveryModel> priorityDeliveryOrders = [];
    for (var order in result["data"]["data"]) {
      priorityDeliveryOrders.add(PriorityDeliveryModel.fromJson(order));
    }
    return priorityDeliveryOrders;
  }

  @override
  Future<List<DispatchDeliveryEntity>> getDispatchAgents() async {
    var result =
        await apiService.get(endPoint: 'api/Selectors/GetAllDispatchAgents');
    List<DispatchDeliveryEntity> agents = [];
    for (var item in result["data"]) {
      agents.add(DispatchDeliveryEntity(
          id: item["id"] as String,
          agentName: item["name"] as String,
          isSelected: false));
    }
    return agents;
  }

  @override
  Future<PrioritySummaryModel> getDeliverySummary(
      GetSummaryEntity getpicSummaryEntity) async {
    var result = await apiService.get(
      endPoint:
          'api/Quotas/GetSummary?Date=${getpicSummaryEntity.date.toIso8601String()}&SalesId=${getpicSummaryEntity.salesId}&RegionId=${getpicSummaryEntity.regionId}&MaterialId=${getpicSummaryEntity.matrialId}&DispatchChannel=Delivery',
    );
    PrioritySummaryModel summary =
        PrioritySummaryModel.fromJson(result["data"]);
    return summary;
  }

  @override
  Future<bool> addNewDispatcher(String dispatcher) async {
    var result = await apiService.post(
      endPoint: 'api/Delivery/CreateDispatcher',
      data: {"name": dispatcher},
    );
    bool successed = result["data"] as bool;
    return successed;
  }

  @override
  Future<bool> editDispatcherName(
      String dispatcherId, String dispatcherName) async {
    var result = await apiService.put(
      endPoint: 'api/Delivery/UpdateDispatcher',
      data: {
        "id": dispatcherId,
        "name": dispatcherName,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }
  
  @override
  Future<bool> deleteDispatchers(List<String> dispatchers) async{
    var result = await apiService.put(
      endPoint: 'api/Delivery/DeleteDispatcher',
      data: {
        "dispatchers": dispatchers,
      },
    );
    bool successed = result["data"] as bool;
    return successed;
  }
}

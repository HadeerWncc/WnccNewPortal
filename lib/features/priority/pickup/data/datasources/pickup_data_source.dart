import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';

abstract class PickupDataSource {
  Future<List<PickupModel>> getPickupPriority(DateTime date);
  Future<String> makePickupilityEntity(MakePickupilityEntity makePickupility);
  Future<PrioritySummaryModel> getPickupSummary(
      GetSummaryEntity getpicSummaryEntity);
}

class PickupDataSourceImpl extends PickupDataSource {
  final ApiService apiService;

  PickupDataSourceImpl({required this.apiService});
  @override
  Future<List<PickupModel>> getPickupPriority(DateTime date) async {
    var result =
        await apiService.get(endPoint: 'api/Pickup/GetPickupility?date=$date');
    List<PickupModel> pickupPriorityList = [];
    for (var order in result["data"]) {
      pickupPriorityList.add(PickupModel.fromJson(order));
    }
    return pickupPriorityList;
  }

  @override
  Future<String> makePickupilityEntity(
      MakePickupilityEntity makePickupility) async {
    var data = {
      "pickuplityItems": makePickupility.pickuplityItems
          .map((m) => {
                "priorityQuantity": m.priorityQuantity,
                "dispatchQuantity": m.dispatchQuantity,
                "customerId": m.customerId,
                "materialId": m.materialId,
                "salesId": m.salesId
              })
          .toList(),
      "date": (makePickupility.date).toIso8601String(),
    };
    var result = await apiService.put(
      endPoint: 'api/Pickup/MakePickupility',
      data: data,
    );
    String successed = result["message"] as String;
    return successed;
  }

  @override
  Future<PrioritySummaryModel> getPickupSummary(
      GetSummaryEntity getpicSummaryEntity) async {
    var result = await apiService.get(
      endPoint:
          'api/Quotas/GetSummary?Date=${getpicSummaryEntity.date.toIso8601String()}&SalesId=${getpicSummaryEntity.salesId}&RegionId=${getpicSummaryEntity.regionId}&MaterialId=${getpicSummaryEntity.matrialId}&DispatchChannel=Pickup',
    );
    PrioritySummaryModel summary =
        PrioritySummaryModel.fromJson(result["data"]);
    return summary;
  }
}

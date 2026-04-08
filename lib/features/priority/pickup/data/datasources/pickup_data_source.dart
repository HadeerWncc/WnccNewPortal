import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';

abstract class PickupDataSource {
  Future<List<PickupModel>> getPickupPriority(DateTime date);
  Future<String> makePickupilityEntity(MakePickupilityEntity makePickupility);
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
      "type": makePickupility.type,
      "date": (makePickupility.date).toIso8601String(),
    };
    var result = await apiService.post(
      endPoint: 'api/Delivery/MakePriority',
      data: data,
    );
    String successed = result["message"] as String;
    return successed;
  }
}

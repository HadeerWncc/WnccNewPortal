import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';

abstract class PendingDataSource {
    Future<List<PendingModel>> getPendingDelivery();
}

class PendingDataSourceImpl extends PendingDataSource{
  final ApiService apiService;

  PendingDataSourceImpl({required this.apiService});
  @override
  Future<List<PendingModel>> getPendingDelivery() async {
    var result = await apiService.get(
        endPoint: 'api/Delivery/GetAll');
    List<PendingModel> pendingDeliveryList = [];
    for (var pending in result["data"]) {
      PendingModel pendingDelivery = PendingModel.fromJson(pending);
      pendingDeliveryList.add(pendingDelivery);
    }
    return pendingDeliveryList;
  }

}
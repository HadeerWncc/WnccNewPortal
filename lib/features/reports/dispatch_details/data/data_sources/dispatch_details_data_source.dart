import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';

abstract class DispatchDetailsDataSource {
  Future<List<DispatchDetailsPerRegionModel>> getDispatchDetails(
      DateTime date, int zone);
  // Future<List<ShipmentDetailsModel>> getShipmentDetails();
  // Future<List<DispatchDetailsModel>> getDispatchDetailsPerSales(
  //     DateTime from, DateTime to);
  // Future<List<DispatchDetailsModel>> getDispatchDetailsPerCustomer(
  //     DateTime from, DateTime to);
}

class DispatchDetailsDataSourceImpl extends DispatchDetailsDataSource {
  final ApiService apiService;

  DispatchDetailsDataSourceImpl({required this.apiService});
  @override
  Future<List<DispatchDetailsPerRegionModel>> getDispatchDetails(
      DateTime date, int zone) async {
    DateTime toDate = DateTime.now();

    if (date.year != DateTime.now().year) {
      toDate = DateTime(date.year + 1, 1);
    }
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetDispatchDetails?fromDate=${DateTime(date.year, 1)}&toDate=$toDate&group=0&zone=$zone');
    List<DispatchDetailsPerRegionModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchDetailsPerRegionModel dispatchDetailsModel =
          DispatchDetailsPerRegionModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }

}

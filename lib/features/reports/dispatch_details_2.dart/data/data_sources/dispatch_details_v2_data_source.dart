import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';

abstract class DispatchDetailsV2DataSource {
  Future<List<DispatchDetailsVsModel>> getDispatchDetailsPerSales(
      DateTime date, int zone);
  Future<List<DispatchDetailsVsModel>> getDispatchDetailsPerCustomer(
      DateTime date, int zone);
  Future<List<DispatchDetailsPerRegionModel>> getDispatchDetailsPerRegion(
      DateTime date, int zone);
}

class DispatchDetailsV2DataSourceImpl extends DispatchDetailsV2DataSource {
  final ApiService apiService;

  DispatchDetailsV2DataSourceImpl({required this.apiService});
  @override
  Future<List<DispatchDetailsVsModel>> getDispatchDetailsPerSales(
      DateTime date, int zone) async {
    DateTime toDate = DateTime.now();
    if (date.year != DateTime.now().year) {
      toDate = DateTime(date.year + 1, 1);
    }
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetDispatchV3Details?fromDate=${DateTime(date.year, 1)}&toDate=$toDate&group=1&zone=$zone');
    List<DispatchDetailsVsModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchDetailsVsModel dispatchDetailsModel =
          DispatchDetailsVsModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }

  @override
  Future<List<DispatchDetailsVsModel>> getDispatchDetailsPerCustomer(
      DateTime date, int zone) async {
    DateTime toDate = DateTime.now();

    if (date.year != DateTime.now().year) {
      toDate = DateTime(date.year + 1, 1);
    }
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetDispatchV3Details?fromDate=${DateTime(date.year, 1)}&toDate=$toDate&group=2&zone=$zone');
    List<DispatchDetailsVsModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchDetailsVsModel dispatchDetailsModel =
          DispatchDetailsVsModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }
  
  @override
  Future<List<DispatchDetailsPerRegionModel>> getDispatchDetailsPerRegion(DateTime date, int zone) async{
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

import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';

abstract class LoadingDetailsDataSourse {
  Future<List<LoadingDetailsModel>> getLoadingDetails();
}

class LoadingDetailsDataSourseImpl extends LoadingDetailsDataSourse {
  final ApiService apiService;

  LoadingDetailsDataSourseImpl({required this.apiService});
  @override
  Future<List<LoadingDetailsModel>> getLoadingDetails() async {
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetLoadingDetails?fromDate=1/2/2026&toDate=${DateTime.now()}');
    List<LoadingDetailsModel> loadingdetailsList = [];
    for (var loading in result["data"]) {
      LoadingDetailsModel loadingDetails =
          LoadingDetailsModel.fromJson(loading);
      loadingdetailsList.add(loadingDetails);
    }
    return loadingdetailsList;
  }
}

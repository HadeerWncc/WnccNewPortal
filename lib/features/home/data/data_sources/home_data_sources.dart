import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/home_summary.dart';

abstract class HomeDataSources {
  Future<HomeSummary> getHomeSummary(DateTime fromDate, DateTime toDate, String? code);
}

class HomeDataSourcesImpl extends HomeDataSources {
  final ApiService apiService;

  HomeDataSourcesImpl({required this.apiService});
  @override
  Future<HomeSummary> getHomeSummary(
      DateTime fromDate, DateTime toDate, String? code) async {
        String endPoint = code == null?'api/Home/GetHome?fromDate=$fromDate&toDate=$toDate' : 'api/Home/GetHome?fromDate=$fromDate&toDate=$toDate&code=$code';
    var result = await apiService.get(
      endPoint: endPoint,
    );
    HomeSummary homeData = HomeSummary.fromJson(result["data"]);
    return homeData;
  }
}

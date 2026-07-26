import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/home/data/models/home/home.summary.model.dart';

abstract class HomeDataSources {
  Future<Home> getHomeSummary(DateTime fromDate, DateTime toDate, String code);
}

class HomeDataSourcesImpl extends HomeDataSources {
  final ApiService apiService;

  HomeDataSourcesImpl({required this.apiService});
  @override
  Future<Home> getHomeSummary(
      DateTime fromDate, DateTime toDate, String code) async {
    var result = await apiService.get(
      endPoint: 'api/Home/GetHome?fromDate=$fromDate&toDate=$toDate&code=$code',
    );
    Home homeData = Home.fromJson(result["data"]);
    return homeData;
  }
}

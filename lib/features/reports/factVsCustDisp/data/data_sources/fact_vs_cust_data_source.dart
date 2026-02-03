import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/data/models/compare_model/compare_model.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';

abstract class FactVsCustDatasourse {
  Future<List<FactVsCustDispModel>> getFactVsCustDisp(int mode, DateTime date);
  Future<CompareModel> getFactVsCustDispCompare(DateTime selectedDate, DateTime compareDate);
}

class FactVsCustDatasourseImpl extends FactVsCustDatasourse {
  final ApiService apiService;

  FactVsCustDatasourseImpl({required this.apiService});

  @override
  Future<List<FactVsCustDispModel>> getFactVsCustDisp(
      int mode, DateTime date) async {
    var result = await apiService.get(
        endPoint: 'api/Reports/GetFactoryVsDispatch?mode=$mode&date=$date');
    List<FactVsCustDispModel> factVsCustDispList = [];
    for (var factVsCust in result["data"]) {
      FactVsCustDispModel factVsCustDispModel =
          FactVsCustDispModel.fromJson(factVsCust);
      factVsCustDispList.add(factVsCustDispModel);
    }
    return factVsCustDispList;
  }

  @override
  Future<CompareModel> getFactVsCustDispCompare(DateTime selectedDate, DateTime compareDate) async {
    var result = await apiService.get(
        endPoint: 'api/Reports/GetFactoryVsDispatchCompare?selectedYear=$selectedDate&compareYear=$compareDate');
    CompareModel compareModel = CompareModel.fromJson(result["data"]);
    return compareModel;
  }
}

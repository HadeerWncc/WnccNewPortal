import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_compare_model/Fact_vs_cust_disp_compare.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';

abstract class FactVsCustDatasourse {
  Future<List<FactVsCustDispModel>> getFactVsCustDisp(int mode, DateTime date);
  Future<List<FactVsCustDispCompare>> getFactVsCustDispCompare(DateTime date);
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
  Future<List<FactVsCustDispCompare>> getFactVsCustDispCompare(DateTime date) {
    // TODO: implement getFactVsCustDispCompare
    throw UnimplementedError();
  }
}

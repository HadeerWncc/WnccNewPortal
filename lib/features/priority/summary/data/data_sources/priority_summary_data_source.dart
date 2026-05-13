import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/priority/summary/data/models/summary_priority_model.dart';

abstract class PrioritySummaryDataSource {
   Future<List<SummaryPriorityModel>> getPrioritySummary(DateTime fDate, DateTime tDate);
}

class PrioritySummaryDataSourceImpl extends PrioritySummaryDataSource{
  final ApiService apiService;

  PrioritySummaryDataSourceImpl({required this.apiService});
  
  @override
  Future<List<SummaryPriorityModel>> getPrioritySummary(DateTime fDate, DateTime tDate) async{
    var result =
        await apiService.get(endPoint: 'api/Quotas/Summary/Details?FromDate=$fDate&ToDate=$tDate');
    List<SummaryPriorityModel> prioritySummary = [];
    for (var order in result["data"]) {
      prioritySummary.add(SummaryPriorityModel.fromJson(order));
    }
    return prioritySummary;
  }

}

import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';

abstract class ExportDispatchDetailsDataSource {
  Future<List<Export>> getExportDispatchDetails(
      DateTime date, int mode, int group);
}

class ExportDispatchDetailsDataSourseImpl
    extends ExportDispatchDetailsDataSource {
  final ApiService apiService;

  ExportDispatchDetailsDataSourseImpl({required this.apiService});
  @override
  Future<List<Export>> getExportDispatchDetails(
      DateTime date, int mode, int group) async {
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetExportDispatchDetails?mode=$mode&group=$group&date=$date');
    List<Export> exportDispatchList = [];
    for (var dispach in result["data"]) {
      Export exportDispatchModel = Export.fromJson(dispach);
      exportDispatchList.add(exportDispatchModel);
    }
    return exportDispatchList;
  }
}

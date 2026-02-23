import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/entities/loading_details_summary_entity.dart';

LoadingDetailsSummaryEntity calculateSumSummary(
    List<LoadingDetailsModel> loadingDetails, int status) {
  num wadi = 0;
  num masry = 0;
  num bulk = 0;
  num others = 0;
  num total = 0;
  if (status == 0) {
    loadingDetails =
        loadingDetails.where((l) => l.loadStartDate == null).toList();
  } else if (status == 1) {
    loadingDetails =
        loadingDetails.where((l) => l.loadStartDate != null).toList();
  }
  for (var l in loadingDetails) {
    if (l.materialId == 'F-BU01') {
      bulk += l.deliveryQuantity ?? 0;
    } else if (l.materialId == 'F-BA01') {
      masry += l.deliveryQuantity ?? 0;
    } else if (l.materialId == 'F-BA02') {
      wadi += l.deliveryQuantity ?? 0;
    } else {
      others += l.deliveryQuantity ?? 0;
    }
  }
  total = wadi + masry + bulk + others;
  return LoadingDetailsSummaryEntity(
      bulk: bulk, masry: masry, others: others, total: total, wadie: wadi);
}

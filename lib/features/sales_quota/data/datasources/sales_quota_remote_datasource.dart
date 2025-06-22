import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';

abstract class SalesQuotaRemoteDatasource {
  Future<DailyQuotaModel> getDailyQuota({String date});
  Future<String> setDailyQuota(DailyQuotaEntity dailyQuotaEntity);
  Future<String> copyDailyQuota(CopyQuotaDateEntity dailyQuotaEntity);
}

class SalesQuotaRemoteDatasourceImpl extends SalesQuotaRemoteDatasource {
  final ApiService apiService;

  SalesQuotaRemoteDatasourceImpl({required this.apiService});
  @override
  Future<DailyQuotaModel> getDailyQuota({String? date}) async {
    var result = await apiService.get(
        endPoint: 'api/DailyQuotas/GetDailyQuotaByDate?date=$date');
    DailyQuotaModel dailyQuotaModel = DailyQuotaModel.fromJson(result["data"]);
    return dailyQuotaModel;
  }

  @override
  Future<String> setDailyQuota(DailyQuotaEntity dailyQuotaEntity) async {
    var result = await apiService.post(
      endPoint: 'api/DailyQuotas/DistributeDailyQuota',
      data: dailyQuotaEntity.toJson(),
    );
    String message = result["message"] as String;
    return message;
  }

  @override
  Future<String> copyDailyQuota(CopyQuotaDateEntity copyQuotaEntity) async {
    var result = await apiService.post(
      endPoint: 'api/DailyQuotas/DistributeDailyQuotaFromCopy',
      data: copyQuotaEntity.toJson(),
    );
    String message = result["message"] as String;
    return message;
  }
}

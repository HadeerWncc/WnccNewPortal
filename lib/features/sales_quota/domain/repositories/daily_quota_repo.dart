import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';

abstract class DailyQuotaRepo {
  Future<Either<Failure, DailyQuotaModel>> getDailyQuota(String date);
  Future<Either<Failure, String>> setDailyQuota(
      DailyQuotaEntity dailyQuotaEntity);
  Future<Either<Failure, String>> copyDailyQuota(
      CopyQuotaDateEntity copyQuotaEntity);
}

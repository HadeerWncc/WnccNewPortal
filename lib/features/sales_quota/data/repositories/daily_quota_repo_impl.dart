import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/sales_quota/data/datasources/sales_quota_remote_datasource.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/repositories/daily_quota_repo.dart';

class DailyQuotaRepoImpl extends DailyQuotaRepo {
  final SalesQuotaRemoteDatasource salesQuotaRemoteDatasource;

  DailyQuotaRepoImpl({required this.salesQuotaRemoteDatasource});
  @override
  Future<Either<Failure, DailyQuotaModel>> getDailyQuota(String date) async {
    try {
      DailyQuotaModel dailyQuota =
          await salesQuotaRemoteDatasource.getDailyQuota(date: date);
      return Right(dailyQuota);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> setDailyQuota(
      DailyQuotaEntity dailyQuotaEntity) async {
    try {
      String message =
          await salesQuotaRemoteDatasource.setDailyQuota(dailyQuotaEntity);
      return Right(message);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> copyDailyQuota(
      CopyQuotaDateEntity copyQuotaEntity) async {
    try {
      String message =
          await salesQuotaRemoteDatasource.copyDailyQuota(copyQuotaEntity);
      return Right(message);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

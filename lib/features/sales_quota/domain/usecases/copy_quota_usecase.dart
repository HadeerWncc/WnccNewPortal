import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/repositories/daily_quota_repo.dart';

class CopyQuotaUsecase extends UseCase<String, CopyQuotaDateEntity> {
  final DailyQuotaRepo dailyQuotaRepo;

  CopyQuotaUsecase({required this.dailyQuotaRepo});
  @override
  Future<Either<Failure, String>> call([CopyQuotaDateEntity? param]) async {
    var result = dailyQuotaRepo.copyDailyQuota(param!);
    return result;
  }
}

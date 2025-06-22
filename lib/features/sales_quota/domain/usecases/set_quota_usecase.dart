import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/repositories/daily_quota_repo.dart';

class SetQuotaUsecase extends UseCase<String, DailyQuotaEntity> {
  final DailyQuotaRepo dailyQuotaRepo;

  SetQuotaUsecase({required this.dailyQuotaRepo});
  @override
  Future<Either<Failure, String>> call([DailyQuotaEntity? param]) {
    var result = dailyQuotaRepo.setDailyQuota(param!);
    return result;
  }
}

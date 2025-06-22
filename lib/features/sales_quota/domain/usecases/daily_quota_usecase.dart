import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/repositories/daily_quota_repo.dart';

class DailyQuotaUsecase extends UseCase<DailyQuotaModel, String> {
  final DailyQuotaRepo dailyQuotaRepo;

  DailyQuotaUsecase({required this.dailyQuotaRepo});
  @override
  Future<Either<Failure, DailyQuotaModel>> call([String? param]) async {
    var result = await dailyQuotaRepo.getDailyQuota(param!);
    return result;
  }
}

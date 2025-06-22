import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';

class ResetPasswordUseCase extends UseCase<bool, ResetPasswordEntity> {
  final AuthRepo loginRepo;

  ResetPasswordUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, bool>> call([ResetPasswordEntity? param]) async {
    return await loginRepo.resetPassword(resetPassword: param!);
  }
}

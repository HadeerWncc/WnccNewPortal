import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/features/user/domain/repositories/first_login_change_password_repo.dart';

class FirstLoginChangePassUseCase extends UseCase<bool, ChangePasswordEntity> {
  final FirstLoginChangePasswordRepo firstLoginChangePasswordRepo;

  FirstLoginChangePassUseCase({required this.firstLoginChangePasswordRepo});
  @override
  Future<Either<Failure, bool>> call([ChangePasswordEntity? param]) async {
    return await firstLoginChangePasswordRepo.firstLoginChangePassword(
        changePasswordEntity: param!);
  }
}

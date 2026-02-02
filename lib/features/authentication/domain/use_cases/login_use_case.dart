import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/authentication/data/models/login_model/login_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';

class LoginUseCase extends UseCase<LoginModel, LoginEntity> {
  final AuthRepo loginRepo;

  LoginUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, LoginModel>> call([LoginEntity? param]) async {
    return await loginRepo.login(loginEntity: param!);
  }
}

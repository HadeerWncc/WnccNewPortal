import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';

class ForgetPasswordUseCase extends UseCase<bool, String> {
  final AuthRepo loginRepo;

  ForgetPasswordUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, bool>> call([String? param]) async {
    return await loginRepo.forgetPassword(email: param!);
  }
}

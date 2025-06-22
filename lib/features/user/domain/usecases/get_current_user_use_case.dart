import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';

class GetCurrentUserUseCase extends UseCase<UserModel, void> {
  final UserRepo userRepo;

  GetCurrentUserUseCase({required this.userRepo});
  @override
  Future<Either<Failure, UserModel>> call([void param]) async {
    return await userRepo.getCurrentUer();
  }
}

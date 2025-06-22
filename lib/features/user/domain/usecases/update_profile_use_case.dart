import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';

class UpdateProfileUseCase extends UseCase<UserModel, ProfileEntity> {
  final UserRepo userRepo;

  UpdateProfileUseCase({required this.userRepo});
  @override
  Future<Either<Failure, UserModel>> call([ProfileEntity? param]) async {
    return await userRepo.updateProfile(param!);
  }
}

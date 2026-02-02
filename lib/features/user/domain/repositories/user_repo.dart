import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> completeProfile(String startupRoute);
  Future<Either<Failure, UserModel>> getCurrentUer();
  Future<Either<Failure, UserModel>> updateProfile(ProfileEntity profileEntity);
  Future<Either<Failure, List<UserModel>>> getAllUsers();
  Future<Either<Failure, bool>> selectStartUpRoute(String id, String routeName);
}

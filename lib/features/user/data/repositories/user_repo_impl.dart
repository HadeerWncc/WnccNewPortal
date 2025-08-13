import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/data/datasources/user_remote_data_source.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepoImpl({required this.userRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> completeProfile() async {
    try {
      UserModel user = await userRemoteDataSource.completeProfile();
      return Right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUer() async {
    try {
      UserModel user = await userRemoteDataSource.getCurrentUser();
      return Right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(
      ProfileEntity profileEntity) async {
    try {
      UserModel user = await userRemoteDataSource.updateProfile(profileEntity);
      return Right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async{
    try {
      List<UserModel> users = await userRemoteDataSource.getAllUsers();
      users = users.reversed.toList();
      return Right(users);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

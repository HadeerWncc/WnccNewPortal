import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/features/user/data/datasources/first_login_change_password_remote_data_source.dart';
import 'package:wncc_portal/features/user/domain/repositories/first_login_change_password_repo.dart';

class FirstLoginChangePasswordRepoImpl extends FirstLoginChangePasswordRepo {
  final FirstLoginChangePasswordRemoteDataSource
      firstLoginChangePasswordRemoteDataSource;

  FirstLoginChangePasswordRepoImpl(
      {required this.firstLoginChangePasswordRemoteDataSource});
  @override
  Future<Either<Failure, bool>> firstLoginChangePassword(
      {required ChangePasswordEntity changePasswordEntity}) async {
    try {
      bool successed = await firstLoginChangePasswordRemoteDataSource
          .changePassword(changePasswordEnitiy: changePasswordEntity);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

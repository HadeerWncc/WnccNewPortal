import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/utils/shared_preferences.dart';
import 'package:wncc_portal/features/authentication/data/data_sources/auth_remote_date_source.dart';
import 'package:wncc_portal/features/authentication/data/models/login_model/login_model.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthRemoteDateSource authRemoteDateSource;

  AuthRepoImp({required this.authRemoteDateSource});
  @override
  Future<Either<Failure, LoginModel>> login({LoginEntity? loginEntity}) async {
    try {
      LoginModel user;
      user = await authRemoteDateSource.login(loginEntity: loginEntity!);
      saveToken('token', user.token!);
      saveToken('refershToken', user.refreshToken!);
      return Right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPassword({String? email}) async {
    try {
      bool suceess = await authRemoteDateSource.forgetPassword(email: email!);
      return Right(suceess);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ValidateCodeModel>> validateCode(
      {ValidateCodeEntity? validateModel}) async {
    try {
      ValidateCodeModel validateCodeModel;
      validateCodeModel = await authRemoteDateSource.validateCode(
          validateCodeEntity: validateModel!);
      return Right(validateCodeModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      {ResetPasswordEntity? resetPassword}) async {
    try {
      bool suceess = await authRemoteDateSource.resetPassword(
          resetPasswordEntity: resetPassword!);
      return Right(suceess);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

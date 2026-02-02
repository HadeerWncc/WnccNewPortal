import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/authentication/data/models/login_model/login_model.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login({LoginEntity loginEntity});
  Future<Either<Failure, bool>> forgetPassword({String email});
  Future<Either<Failure, ValidateCodeModel>> validateCode(
      {ValidateCodeEntity validateModel});
  Future<Either<Failure, bool>> resetPassword(
      {ResetPasswordEntity resetPassword});
}

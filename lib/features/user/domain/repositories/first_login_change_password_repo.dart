import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';

abstract class FirstLoginChangePasswordRepo {
  Future<Either<Failure, bool>> firstLoginChangePassword(
      {required ChangePasswordEntity changePasswordEntity});
}

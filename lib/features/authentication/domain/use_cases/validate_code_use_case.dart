import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/use_cases/use_case.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';

class ValidateCodeUseCase
    extends UseCase<ValidateCodeModel, ValidateCodeEntity> {
  final AuthRepo loginRepo;

  ValidateCodeUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, ValidateCodeModel>> call(
      [ValidateCodeEntity? param]) async {
    return await loginRepo.validateCode(validateModel: param!);
  }
}

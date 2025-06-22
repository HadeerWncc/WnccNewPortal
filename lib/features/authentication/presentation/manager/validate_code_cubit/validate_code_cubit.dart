import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/validate_code_use_case.dart';

part 'validate_code_state.dart';

class ValidateCodeCubit extends Cubit<ValidateCodeState> {
  ValidateCodeCubit(this.validateCodeUseCase) : super(ValidateCodeInitial());
  final ValidateCodeUseCase validateCodeUseCase;
  Future<void> validateCode(ValidateCodeEntity validateCodeEntity) async {
    emit(ValidateCodeLoading());
    var result = await validateCodeUseCase.call(validateCodeEntity);
    result.fold(
      (error) {
        emit(ValidateCodeFailure(error.msg));
      },
      (validate) {
        emit(ValidateCodeSuccess(validate));
      },
    );
  }
}

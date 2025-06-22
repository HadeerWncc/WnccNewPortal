import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswordUseCase;
  Future<void> resetPassword(ResetPasswordEntity resetPasswordEntity) async {
    emit(ResetPasswordLoading());
    var result = await resetPasswordUseCase.call(resetPasswordEntity);
    result.fold(
      (error) {
        emit(ResetPasswordFailure(error.msg));
      },
      (success) {
        if (success == true) {
          emit(const ResetPasswordSuccess("Password Reset Successfuly"));
        } else {
          emit(
              const ResetPasswordFailure('An Error occour, Please try again!'));
        }
      },
    );
  }
}

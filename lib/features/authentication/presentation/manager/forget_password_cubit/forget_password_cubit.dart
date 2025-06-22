import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase forgetPasswordUseCase;
  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordUseCase.call(email);
    result.fold((error) {
      emit(ForgetPasswordFailure(error.msg));
    }, (success) {
      if (success == true) {
        emit(
          const ForgetPasswordSuccess(
            "Please Check your mail for validation code!",
          ),
        );
      } else {
        emit(
          const ForgetPasswordFailure(
            "An error occurred, please try again!",
          ),
        );
      }
    });
  }
}

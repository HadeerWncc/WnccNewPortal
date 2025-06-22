import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/features/user/domain/usecases/first_login_change_pass_use_case.dart';

part 'first_login_change_password_state.dart';

class FirstLoginChangePasswordCubit
    extends Cubit<FirstLoginChangePasswordState> {
  final FirstLoginChangePassUseCase firstLoginChangePassUseCase;
  FirstLoginChangePasswordCubit(this.firstLoginChangePassUseCase)
      : super(FirstLoginChangePasswordInitial());

  Future<void> changePassword(ChangePasswordEntity changePasswordEntity) async {
    emit(FirstLoginChangePasswordLoading());
    var result = await firstLoginChangePassUseCase.call(changePasswordEntity);
    result.fold((error) {
      emit(FirstLoginChangePasswordFailed(failureMsg: error.msg));
    }, (successed) {
      if (successed == true) {
        emit(const FirstLoginChangePasswordSuccess(
            successMsg: "Password changed successfully"));
      } else {
        emit(const FirstLoginChangePasswordFailed(
            failureMsg: "there was an error"));
      }
    });
  }
}

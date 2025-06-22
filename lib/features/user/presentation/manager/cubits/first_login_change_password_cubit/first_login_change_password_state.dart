part of 'first_login_change_password_cubit.dart';

sealed class FirstLoginChangePasswordState extends Equatable {
  const FirstLoginChangePasswordState();

  @override
  List<Object> get props => [];
}

final class FirstLoginChangePasswordInitial
    extends FirstLoginChangePasswordState {}

final class FirstLoginChangePasswordFailed
    extends FirstLoginChangePasswordState {
  final String failureMsg;

  const FirstLoginChangePasswordFailed({required this.failureMsg});
}

final class FirstLoginChangePasswordLoading
    extends FirstLoginChangePasswordState {}

final class FirstLoginChangePasswordSuccess
    extends FirstLoginChangePasswordState {
  final String successMsg;

  const FirstLoginChangePasswordSuccess({required this.successMsg});
}

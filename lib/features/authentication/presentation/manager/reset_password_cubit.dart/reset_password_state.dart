part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  const ResetPasswordFailure(this.error);
}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String successMsg;

  const ResetPasswordSuccess(this.successMsg);
}

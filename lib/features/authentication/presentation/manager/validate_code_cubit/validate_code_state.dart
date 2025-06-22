part of 'validate_code_cubit.dart';

sealed class ValidateCodeState extends Equatable {
  const ValidateCodeState();

  @override
  List<Object> get props => [];
}

final class ValidateCodeInitial extends ValidateCodeState {}

final class ValidateCodeSuccess extends ValidateCodeState {
  final ValidateCodeModel validateCodeModel;

  const ValidateCodeSuccess(this.validateCodeModel);
}

final class ValidateCodeFailure extends ValidateCodeState {
  final String error;

  const ValidateCodeFailure(this.error);
}

final class ValidateCodeLoading extends ValidateCodeState {}

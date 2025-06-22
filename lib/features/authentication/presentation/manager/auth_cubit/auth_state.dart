part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final LoginModel loginModel;
  const AuthSuccess({required this.loginModel});
}

final class AuthFailure extends AuthState {
  final String error;
  const AuthFailure({required this.error});
}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class Unauthenticated extends AuthState {}

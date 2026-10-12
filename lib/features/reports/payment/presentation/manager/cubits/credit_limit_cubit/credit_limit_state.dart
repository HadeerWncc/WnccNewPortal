part of 'credit_limit_cubit.dart';

sealed class CreditLimitState extends Equatable {
  const CreditLimitState();

  @override
  List<Object> get props => [];
}

final class CreditLimitInitial extends CreditLimitState {}

final class CreditLimitLoading extends CreditLimitState {}

final class CreditLimitFailure extends CreditLimitState {
  final String error;

  const CreditLimitFailure({required this.error});
}

final class CreditLimitSuccess extends CreditLimitState {
  final List<CreditLimit> creditLimit;

  const CreditLimitSuccess({required this.creditLimit});
}

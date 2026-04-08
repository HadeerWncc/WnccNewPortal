part of 'customer_balance_cubit.dart';

sealed class CustomerBalanceState extends Equatable {
  const CustomerBalanceState();

  @override
  List<Object> get props => [];
}

final class CustomerBalanceInitial extends CustomerBalanceState {}

final class CustomerBalanceLoading extends CustomerBalanceState {}

final class CustomerBalanceFailure extends CustomerBalanceState {
  final String error;

  const CustomerBalanceFailure({required this.error});
}

final class CustomerBalanceSuccess extends CustomerBalanceState {
  final List<CustomerBalance> customerBalance;

  const CustomerBalanceSuccess({required this.customerBalance});
}

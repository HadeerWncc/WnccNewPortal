part of 'payment_per_customer_cubit.dart';

sealed class PaymentPerCustomerState extends Equatable {
  const PaymentPerCustomerState();

  @override
  List<Object> get props => [];
}

final class PaymentPerCustomerInitial extends PaymentPerCustomerState {}
final class PaymentPerCustomerLoading extends PaymentPerCustomerState {}
final class PaymentPerCustomerFailure extends PaymentPerCustomerState {
  final String error;

  const PaymentPerCustomerFailure({required this.error});
}
final class PaymentPerCustomerSuccess extends PaymentPerCustomerState {
  final List<CustomerDeposit> customerDeposit;

  const PaymentPerCustomerSuccess({required this.customerDeposit});
}

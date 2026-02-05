part of 'payments_cubit.dart';

sealed class PaymentsState extends Equatable {
  const PaymentsState();

  @override
  List<Object> get props => [];
}

final class PaymentsInitial extends PaymentsState {}
final class PaymentsLoading extends PaymentsState {}
final class PaymentsSuccess extends PaymentsState {
  final List<Payment> payments;

  const PaymentsSuccess(this.payments);

  @override
  List<Object> get props => [payments];
}
final class PaymentsFailure extends PaymentsState {
  final String errorMessage;

  const PaymentsFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
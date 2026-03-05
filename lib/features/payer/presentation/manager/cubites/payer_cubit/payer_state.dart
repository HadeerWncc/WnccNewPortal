part of 'payer_cubit.dart';

sealed class PayerState extends Equatable {
  const PayerState();

  @override
  List<Object> get props => [];
}

final class PayerInitial extends PayerState {}

final class PayerLoading extends PayerState {}

final class PayerSuccess extends PayerState {
  final List<PayerModel> payerModel;

  const PayerSuccess({required this.payerModel});
}

final class PayerFailure extends PayerState {
  final String error;

  const PayerFailure({required this.error});
}

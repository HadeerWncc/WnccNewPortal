part of 'payments_details_cubit.dart';

sealed class PaymentsDetailsState extends Equatable {
  const PaymentsDetailsState();

  @override
  List<Object> get props => [];
}

final class PaymentsDetailsInitial extends PaymentsDetailsState {}

final class PaymentsDetailsFailure extends PaymentsDetailsState {
  final String errorMsg;

  const PaymentsDetailsFailure({required this.errorMsg});
}

final class PaymentsDetailsSuccess extends PaymentsDetailsState {
  final List<PaymentDetailsModel> paymentDetails;
  const PaymentsDetailsSuccess({required this.paymentDetails});
}

final class PaymentsDetailsLoading extends PaymentsDetailsState {}

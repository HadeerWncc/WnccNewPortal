part of 'dispatch_details_per_customer_cubit.dart';

sealed class DispatchDetailsPerCustomerState extends Equatable {
  const DispatchDetailsPerCustomerState();

  @override
  List<Object> get props => [];
}

final class DispatchDetailsPerCustomerInitial
    extends DispatchDetailsPerCustomerState {}

final class DispatchDetailsPerCustomerLoading
    extends DispatchDetailsPerCustomerState {}

final class DispatchDetailsPerCustomerFailure
    extends DispatchDetailsPerCustomerState {
  final String error;

  const DispatchDetailsPerCustomerFailure({required this.error});
}

final class DispatchDetailsPerCustomerSuccess
    extends DispatchDetailsPerCustomerState {
  final List<DispatchDetailsModel> dispatchDetails;

  const DispatchDetailsPerCustomerSuccess({required this.dispatchDetails});
}

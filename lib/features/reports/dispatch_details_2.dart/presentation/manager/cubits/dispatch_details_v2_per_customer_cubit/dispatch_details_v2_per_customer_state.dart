part of 'dispatch_details_v2_per_customer_cubit.dart';

sealed class DispatchDetailsV2PerCustomerState extends Equatable {
  const DispatchDetailsV2PerCustomerState();

  @override
  List<Object> get props => [];
}

final class DispatchDetailsV2PerCustomerInitial
    extends DispatchDetailsV2PerCustomerState {}

final class DispatchDetailsV2PerCustomerLoading
    extends DispatchDetailsV2PerCustomerState {}

final class DispatchDetailsV2PerCustomerSuccess
    extends DispatchDetailsV2PerCustomerState {
  final List<DispatchDetailsEntity> dispatchDetails;

  const DispatchDetailsV2PerCustomerSuccess({required this.dispatchDetails});
}

final class DispatchDetailsV2PerCustomerFailure
    extends DispatchDetailsV2PerCustomerState {
  final String error;

  const DispatchDetailsV2PerCustomerFailure({required this.error});
}

part of 'dispatch_details_v2_per_sales_cubit.dart';

sealed class DispatchDetailsV2PerSalesState extends Equatable {
  const DispatchDetailsV2PerSalesState();

  @override
  List<Object> get props => [];
}

final class DispatchDetailsV2PerSalesInitial
    extends DispatchDetailsV2PerSalesState {}

final class DispatchDetailsV2PerSalesLoading
    extends DispatchDetailsV2PerSalesState {}

final class DispatchDetailsV2PerSalesSuccess
    extends DispatchDetailsV2PerSalesState {
  final List<DispatchDetailsEntity> dispatchDetails;

  const DispatchDetailsV2PerSalesSuccess({required this.dispatchDetails});
}

final class DispatchDetailsV2PerSalesFailure
    extends DispatchDetailsV2PerSalesState {
  final String error;

  const DispatchDetailsV2PerSalesFailure({required this.error});
}

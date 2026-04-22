part of 'dispatch_details_per_sales_cubit.dart';

sealed class DispatchDetailsPerSalesState extends Equatable {
  const DispatchDetailsPerSalesState();

  @override
  List<Object> get props => [];
}

final class DispatchDetailsPerSalesInitial
    extends DispatchDetailsPerSalesState {}

final class DispatchDetailsPerSalesFailure
    extends DispatchDetailsPerSalesState {
  final String error;

  const DispatchDetailsPerSalesFailure({required this.error});
}

final class DispatchDetailsPerSalesLoading
    extends DispatchDetailsPerSalesState {}

final class DispatchDetailsPerSalesSuccess
    extends DispatchDetailsPerSalesState {
  final List<DispatchDetailsModel> dispatchDetails;

  const DispatchDetailsPerSalesSuccess({required this.dispatchDetails});
}

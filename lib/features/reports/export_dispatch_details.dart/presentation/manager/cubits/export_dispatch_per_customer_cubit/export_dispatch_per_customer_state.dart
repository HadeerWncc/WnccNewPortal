part of 'export_dispatch_per_customer_cubit.dart';

sealed class ExportDispatchPerCustomerState extends Equatable {
  const ExportDispatchPerCustomerState();

  @override
  List<Object> get props => [];
}

final class ExportDispatchPerCustomerInitial
    extends ExportDispatchPerCustomerState {}

final class ExportDispatchPerCustomerLoading
    extends ExportDispatchPerCustomerState {}

final class ExportDispatchPerCustomerFailure
    extends ExportDispatchPerCustomerState {
  final String error;

  const ExportDispatchPerCustomerFailure({required this.error});
}

final class ExportDispatchPerCustomerSuccess
    extends ExportDispatchPerCustomerState {
  final List<Export> exportDispatchList;

  const ExportDispatchPerCustomerSuccess({required this.exportDispatchList});
}

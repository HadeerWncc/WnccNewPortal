part of 'export_dispatch_per_brand_cubit.dart';

sealed class ExportDispatchPerBrandState extends Equatable {
  const ExportDispatchPerBrandState();

  @override
  List<Object> get props => [];
}

final class ExportDispatchPerBrandInitial extends ExportDispatchPerBrandState {}

final class ExportDispatchPerBrandLoading extends ExportDispatchPerBrandState {}

final class ExportDispatchPerBrandFailure extends ExportDispatchPerBrandState {
  final String error;

  const ExportDispatchPerBrandFailure({required this.error});
}

final class ExportDispatchPerBrandSuccess extends ExportDispatchPerBrandState {
  final List<Export> expDisPerBrand;

  const ExportDispatchPerBrandSuccess({required this.expDisPerBrand});
}

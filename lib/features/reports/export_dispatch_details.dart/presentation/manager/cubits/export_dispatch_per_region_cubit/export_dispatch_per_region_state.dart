part of 'export_dispatch_per_region_cubit.dart';

sealed class ExportDispatchPerRegionState extends Equatable {
  const ExportDispatchPerRegionState();

  @override
  List<Object> get props => [];
}

final class ExportDispatchPerRegionInitial
    extends ExportDispatchPerRegionState {}

final class ExportDispatchPerRegionLoading
    extends ExportDispatchPerRegionState {}

final class ExportDispatchPerRegionFailure
    extends ExportDispatchPerRegionState {
  final String error;

  const ExportDispatchPerRegionFailure({required this.error});
}

final class ExportDispatchPerRegionSuccess
    extends ExportDispatchPerRegionState {
  final List<Export> expDisDetailsPerRegion;

  const ExportDispatchPerRegionSuccess({required this.expDisDetailsPerRegion});
}

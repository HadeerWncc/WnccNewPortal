part of 'dispatch_detasils_v2_per_region_cubit.dart';

sealed class DispatchDetasilsV2PerRegionState extends Equatable {
  const DispatchDetasilsV2PerRegionState();

  @override
  List<Object> get props => [];
}

final class DispatchDetasilsV2PerRegionInitial extends DispatchDetasilsV2PerRegionState {}
final class DispatchDetasilsV2PerRegionLoading extends DispatchDetasilsV2PerRegionState {}
final class DispatchDetasilsV2PerRegionFailure extends DispatchDetasilsV2PerRegionState {
  final String error;

  const DispatchDetasilsV2PerRegionFailure({required this.error});
}
final class DispatchDetasilsV2PerRegionSuccess extends DispatchDetasilsV2PerRegionState {
  final List<DispatchDetailsPerRegionModel> dispatchDetails;

  const DispatchDetasilsV2PerRegionSuccess({required this.dispatchDetails});
}

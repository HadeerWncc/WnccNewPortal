part of 'flat_dispatch_details_cubit.dart';

sealed class FlatDispatchDetailsState extends Equatable {
  const FlatDispatchDetailsState();

  @override
  List<Object> get props => [];
}

final class FlatDispatchDetailsInitial extends FlatDispatchDetailsState {}

final class FlatDispatchDetailsLoading extends FlatDispatchDetailsState {}

final class FlatDispatchDetailsFailure extends FlatDispatchDetailsState {
  final String error;

  const FlatDispatchDetailsFailure({required this.error});
}

final class FlatDispatchDetailsSuccess extends FlatDispatchDetailsState {
  final List<DispatchDetailsFlatDataModel> dispatchDetails;

  const FlatDispatchDetailsSuccess({required this.dispatchDetails});
}

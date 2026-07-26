part of 'pickup_pending_cubit.dart';



sealed class PickupPendingState extends Equatable {
  const PickupPendingState();

  @override
  List<Object> get props => [];
}

final class PickupPendingInitial extends PickupPendingState {}

final class PickupPendingFailure extends PickupPendingState {
  final String error;

  const PickupPendingFailure({required this.error});
}

final class PickupPendingSuccess extends PickupPendingState {
  final List<PendingModel> pendingPickup;

  const PickupPendingSuccess({required this.pendingPickup});
}

final class PickupPendingLoading extends PickupPendingState {}

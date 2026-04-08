part of 'get_pickup_by_id_cubit.dart';

sealed class GetPickupByIdState extends Equatable {
  const GetPickupByIdState();

  @override
  List<Object> get props => [];
}

final class GetPickupByIdInitial extends GetPickupByIdState {}

final class GetPickupByIdLoading extends GetPickupByIdState {}

final class GetPickupByIdFailure extends GetPickupByIdState {
  final String error;

  const GetPickupByIdFailure({required this.error});
}

final class GetPendingPickupByIdSuccess extends GetPickupByIdState {
  final PendingOrder pendingOrder;

  const GetPendingPickupByIdSuccess({required this.pendingOrder});
}

final class GetPriorityPickupByIdSuccess extends GetPickupByIdState {
  final PriorityPickupOrder priorityPickupOrder;

  const GetPriorityPickupByIdSuccess({required this.priorityPickupOrder});
}

final class GetDispatchPickupByIdSuccess extends GetPickupByIdState {
  final DispatchPickupOrder dispatchPickupOrder;
  const GetDispatchPickupByIdSuccess({required this.dispatchPickupOrder});
}

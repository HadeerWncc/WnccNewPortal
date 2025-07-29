part of 'getall_pickup_cubit.dart';

sealed class GetallPickupState extends Equatable {
  const GetallPickupState();

  @override
  List<Object> get props => [];
}

final class GetallPickupInitial extends GetallPickupState {}

final class GetallPickupFailure extends GetallPickupState {
  final String errorMessage;
  const GetallPickupFailure({required this.errorMessage});
}

final class GetallPickupLoading extends GetallPickupState {}

final class GetallPendingPickupSuccess extends GetallPickupState {
  final List<PendingOrder> pendingPickupOrders;
  const GetallPendingPickupSuccess({required this.pendingPickupOrders});
}

final class GetallPriorityPickupSuccess extends GetallPickupState {
  final List<PriorityPickupOrder> priorityPickupOrders;
  const GetallPriorityPickupSuccess({required this.priorityPickupOrders});
}

final class GetallDispatchPickupSuccess extends GetallPickupState {
  final List<DispatchPickupOrder> dispatchPickupOrders;
  const GetallDispatchPickupSuccess({required this.dispatchPickupOrders});
}

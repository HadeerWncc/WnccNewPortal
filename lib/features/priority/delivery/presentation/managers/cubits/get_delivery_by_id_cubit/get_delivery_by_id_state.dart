part of 'get_delivery_by_id_cubit.dart';

sealed class GetDeliveryByIdState extends Equatable {
  const GetDeliveryByIdState();

  @override
  List<Object> get props => [];
}

final class GetDeliveryByIdInitial extends GetDeliveryByIdState {}

final class GetDeliveryByIdLoading extends GetDeliveryByIdState {}

final class GetDeliveryByIdFailure extends GetDeliveryByIdState {
  final String error;

  const GetDeliveryByIdFailure({required this.error});
}

final class GetDeliveryPendingByIdSuccess extends GetDeliveryByIdState {
  final PendingOrder pendingOrder;

  const GetDeliveryPendingByIdSuccess({required this.pendingOrder});
}

final class GetDeliveryPriorityByIdSuccess extends GetDeliveryByIdState {
  final PriorityDeliveryOrder priorityDeliveryOrder;

  const GetDeliveryPriorityByIdSuccess({required this.priorityDeliveryOrder});
}

final class GetDeliveryDispatchByIdSuccess extends GetDeliveryByIdState {
  final DispatchedDeliveryOrder dispatchedDeliveryOrder;

  const GetDeliveryDispatchByIdSuccess({required this.dispatchedDeliveryOrder});
}

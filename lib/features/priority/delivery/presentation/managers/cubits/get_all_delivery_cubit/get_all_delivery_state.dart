part of 'get_all_delivery_cubit.dart';

sealed class GetAllDeliveryState extends Equatable {
  const GetAllDeliveryState();

  @override
  List<Object> get props => [];
}

final class GetAllDeliveryInitial extends GetAllDeliveryState {}

final class GetAllDeliveryLoading extends GetAllDeliveryState {}

final class GetAllDeliveryFailure extends GetAllDeliveryState {
  final String error;

  const GetAllDeliveryFailure({required this.error});
}

final class GetAllPendingDeliverySuccess extends GetAllDeliveryState {
  final List<PendingOrder> pendingOrders;

  const GetAllPendingDeliverySuccess({required this.pendingOrders});
}

final class GetAllPriorityDeliverySuccess extends GetAllDeliveryState {
  final List<PriorityDeliveryOrder> priorityOrders;

  const GetAllPriorityDeliverySuccess({required this.priorityOrders});
}

final class GetAllDispatchDeliverySuccess extends GetAllDeliveryState {
  final List<DispatchedDeliveryOrder> dispatchedOrders;

  const GetAllDispatchDeliverySuccess({required this.dispatchedOrders});
}

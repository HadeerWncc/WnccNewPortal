part of 'delete_delivery_priority_order_cubit.dart';

sealed class DeleteDeliveryPriorityOrderState extends Equatable {
  const DeleteDeliveryPriorityOrderState();

  @override
  List<Object> get props => [];
}

final class DeleteDeliveryPriorityOrderInitial
    extends DeleteDeliveryPriorityOrderState {}

final class DeleteDeliveryPriorityOrderLoading
    extends DeleteDeliveryPriorityOrderState {}

final class DeleteDeliveryPriorityOrderFailure
    extends DeleteDeliveryPriorityOrderState {
  final String error;

  const DeleteDeliveryPriorityOrderFailure({required this.error});
}

final class DeleteDeliveryPriorityOrderSuccess
    extends DeleteDeliveryPriorityOrderState {
  final String msg;

  const DeleteDeliveryPriorityOrderSuccess({required this.msg});
}

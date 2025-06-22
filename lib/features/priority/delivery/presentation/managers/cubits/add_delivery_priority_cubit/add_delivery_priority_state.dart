part of 'add_delivery_priority_cubit.dart';

sealed class AddDeliveryPriorityState extends Equatable {
  const AddDeliveryPriorityState();

  @override
  List<Object> get props => [];
}

final class AddDeliveryPriorityInitial extends AddDeliveryPriorityState {}

final class AddDeliveryPriorityLoading extends AddDeliveryPriorityState {}

final class AddDeliveryPriorityFailure extends AddDeliveryPriorityState {
  final String error;

  const AddDeliveryPriorityFailure({required this.error});
}

final class AddDeliveryPrioritySuccess extends AddDeliveryPriorityState {
  final String msg;

  const AddDeliveryPrioritySuccess({required this.msg});
}

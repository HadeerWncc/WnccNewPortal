part of 'delete_pickup_priority_cubit.dart';

sealed class DeletePickupPriorityState extends Equatable {
  const DeletePickupPriorityState();

  @override
  List<Object> get props => [];
}

final class DeletePickupPriorityInitial extends DeletePickupPriorityState {}

final class DeletePickupPriorityLoading extends DeletePickupPriorityState {}

final class DeletePickupPriorityFailure extends DeletePickupPriorityState {
  final String error;

  const DeletePickupPriorityFailure({required this.error});
}

final class DeletePickupPrioritySuccess extends DeletePickupPriorityState {
  final String message;

  const DeletePickupPrioritySuccess({required this.message});
}

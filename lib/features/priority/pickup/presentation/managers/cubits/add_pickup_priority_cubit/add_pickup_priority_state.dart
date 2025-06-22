part of 'add_pickup_priority_cubit.dart';

sealed class AddPickupPriorityState extends Equatable {
  const AddPickupPriorityState();

  @override
  List<Object> get props => [];
}

final class AddPickupPriorityInitial extends AddPickupPriorityState {}
final class AddPickupPriorityLoading extends AddPickupPriorityState {}
final class AddPickupPriorityFailure extends AddPickupPriorityState {
  final String error;

  const AddPickupPriorityFailure({required this.error});
}
final class AddPickupPrioritySuccess extends AddPickupPriorityState {
  final String message;

  const AddPickupPrioritySuccess({required this.message});
}

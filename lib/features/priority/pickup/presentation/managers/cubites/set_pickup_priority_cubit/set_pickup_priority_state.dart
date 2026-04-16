part of 'set_pickup_priority_cubit.dart';

sealed class SetPickupPriorityState extends Equatable {
  const SetPickupPriorityState();

  @override
  List<Object> get props => [];
}

final class SetPickupPriorityInitial extends SetPickupPriorityState {}

final class SetPickupPriorityLoading extends SetPickupPriorityState {}

final class SetPickupPriorityFailure extends SetPickupPriorityState {
  final String errorMsg;

  const SetPickupPriorityFailure({required this.errorMsg});
}

final class SetPickupPrioritySuccess extends SetPickupPriorityState {
  final String successMsg;

  const SetPickupPrioritySuccess({required this.successMsg});
}

part of 'undispatch_pickup_cubit.dart';

sealed class UndispatchPickupState extends Equatable {
  const UndispatchPickupState();

  @override
  List<Object> get props => [];
}

final class UndispatchPickupInitial extends UndispatchPickupState {}

final class UndispatchPickupLoading extends UndispatchPickupState {}

final class UndispatchPickupFailure extends UndispatchPickupState {
  final String error;

  const UndispatchPickupFailure({required this.error});
}

final class UndispatchPickupSuccess extends UndispatchPickupState {
  final String message;

  const UndispatchPickupSuccess({required this.message});
}

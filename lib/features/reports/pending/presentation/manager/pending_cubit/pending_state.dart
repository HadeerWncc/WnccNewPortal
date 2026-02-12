part of 'pending_cubit.dart';

sealed class PendingState extends Equatable {
  const PendingState();

  @override
  List<Object> get props => [];
}

final class PendingInitial extends PendingState {}
final class PendingFailure extends PendingState {
  final String error;

  const PendingFailure({required this.error});
}
final class PendingSuccess extends PendingState {
  final List<PendingModel> pendingDelivery;

  const PendingSuccess({required this.pendingDelivery});
}
final class PendingLoading extends PendingState {}

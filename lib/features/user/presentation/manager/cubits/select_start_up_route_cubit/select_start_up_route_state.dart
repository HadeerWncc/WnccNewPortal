part of 'select_start_up_route_cubit.dart';

sealed class SelectStartUpRouteState extends Equatable {
  const SelectStartUpRouteState();

  @override
  List<Object> get props => [];
}

final class SelectStartUpRouteInitial extends SelectStartUpRouteState {}

final class SelectStartUpRouteFailure extends SelectStartUpRouteState {
  final String errorMessage;
  const SelectStartUpRouteFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class SelectStartUpRouteSuccess extends SelectStartUpRouteState {
  final bool status;
  const SelectStartUpRouteSuccess({required this.status});

  @override
  List<Object> get props => [status];
}

final class SelectStartUpRouteLoading extends SelectStartUpRouteState {}

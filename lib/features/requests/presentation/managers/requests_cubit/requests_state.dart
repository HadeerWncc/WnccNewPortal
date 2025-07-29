part of 'requests_cubit.dart';

sealed class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

final class RequestsInitial extends RequestsState {}

final class RequestsLoading extends RequestsState {}

final class RequestsSuccess extends RequestsState {
  final List<RequestEntity> requests;

  const RequestsSuccess({required this.requests});
}

final class RequestsFailure extends RequestsState {
  final String error;

  const RequestsFailure({required this.error});
}

part of 'remove_request_cubit.dart';

sealed class RemoveRequestState extends Equatable {
  const RemoveRequestState();

  @override
  List<Object> get props => [];
}

final class RemoveRequestInitial extends RemoveRequestState {}

final class RemoveRequestLoading extends RemoveRequestState {}

final class RemoveRequestFailure extends RemoveRequestState {
  final String error;

  const RemoveRequestFailure({required this.error});
}

final class RemoveRequestSuccess extends RemoveRequestState {
  final String msg;

  const RemoveRequestSuccess({required this.msg});
}

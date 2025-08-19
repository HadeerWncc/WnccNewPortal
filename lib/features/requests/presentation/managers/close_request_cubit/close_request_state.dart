part of 'close_request_cubit.dart';

sealed class CloseRequestState extends Equatable {
  const CloseRequestState();

  @override
  List<Object> get props => [];
}

final class CloseRequestInitial extends CloseRequestState {}

final class CloseRequestLoading extends CloseRequestState {}

final class CloseRequestFailure extends CloseRequestState {
  final String error;

  const CloseRequestFailure({required this.error});
}

final class CloseRequestSuccess extends CloseRequestState {
  final String msg;

  const CloseRequestSuccess({required this.msg});
}

part of 'request_replies_cubit.dart';

sealed class RequestRepliesState extends Equatable {
  const RequestRepliesState();

  @override
  List<Object> get props => [];
}

final class RequestRepliesInitial extends RequestRepliesState {}

final class RequestRepliesLoading extends RequestRepliesState {}

final class RequestRepliesFailure extends RequestRepliesState {
  final String error;

  const RequestRepliesFailure({required this.error});
}

final class RequestRepliesSuccess extends RequestRepliesState {
  final List<MessageDto> requestReplies;

  const RequestRepliesSuccess({required this.requestReplies});
}

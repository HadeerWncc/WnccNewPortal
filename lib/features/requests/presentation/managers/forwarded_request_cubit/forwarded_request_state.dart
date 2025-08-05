part of 'forwarded_request_cubit.dart';

sealed class ForwardedRequestState extends Equatable {
  const ForwardedRequestState();

  @override
  List<Object> get props => [];
}

final class ForwardedRequestInitial extends ForwardedRequestState {}

final class ForwardedRequestLoading extends ForwardedRequestState {}

final class ForwardedRequestFailure extends ForwardedRequestState {
  final String error;

  const ForwardedRequestFailure({required this.error});
}

final class ForwardedRequestSuccess extends ForwardedRequestState {
  final List<ForwardUser> forwardedUser;

  const ForwardedRequestSuccess({required this.forwardedUser});
}

part of 'forwarded_cubit.dart';

sealed class ForwardedState extends Equatable {
  const ForwardedState();

  @override
  List<Object> get props => [];
}

final class ForwardedInitial extends ForwardedState {}

final class ForwardedILoading extends ForwardedState {}

final class ForwardedFailure extends ForwardedState {
  final String error;

  const ForwardedFailure({required this.error});
}

final class ForwardedSuccess extends ForwardedState {
  final List<ForwardUser> forwardedUser;

  const ForwardedSuccess({required this.forwardedUser});
}

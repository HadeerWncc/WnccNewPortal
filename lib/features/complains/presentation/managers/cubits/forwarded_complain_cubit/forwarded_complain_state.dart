part of 'forwarded_complain_cubit.dart';

sealed class ForwardedComplainState extends Equatable {
  const ForwardedComplainState();

  @override
  List<Object> get props => [];
}

final class ForwardedComplainInitial extends ForwardedComplainState {}
final class ForwardedComplainLoading extends ForwardedComplainState {}
final class ForwardedComplainFailure extends ForwardedComplainState {
  final String error;

  const ForwardedComplainFailure({required this.error});
}
final class ForwardedComplainSuccess extends ForwardedComplainState {
  final List<ForwardUser> forwardUsers;

  const ForwardedComplainSuccess({required this.forwardUsers});
}

final class ForwardedComplainToUserSuccess extends ForwardedComplainState {
  final List<ForwardUser> forwardedUser;

  const ForwardedComplainToUserSuccess({required this.forwardedUser});
}


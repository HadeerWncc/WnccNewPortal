part of 'morning_meeting_cubit.dart';

sealed class MorningMeetingState extends Equatable {
  const MorningMeetingState();

  @override
  List<Object> get props => [];
}

final class MorningMeetingInitial extends MorningMeetingState {}

final class MorningMeetingLoading extends MorningMeetingState {}

final class MorningMeetingFailure extends MorningMeetingState {
  final String errorMessage;

  const MorningMeetingFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class MorningMeetingSuccess extends MorningMeetingState {
  final List<FactoryEntity> factoryEntity;
  final List<CustomerDispatchEntity> customerDispatchEntity;

  const MorningMeetingSuccess(
      {required this.factoryEntity, required this.customerDispatchEntity});

  @override
  List<Object> get props => [factoryEntity, customerDispatchEntity];
}

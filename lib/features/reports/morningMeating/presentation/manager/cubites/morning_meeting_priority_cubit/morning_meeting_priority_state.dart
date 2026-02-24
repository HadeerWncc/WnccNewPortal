part of 'morning_meeting_priority_cubit.dart';

sealed class MorningMeetingPriorityState extends Equatable {
  const MorningMeetingPriorityState();

  @override
  List<Object> get props => [];
}

final class MorningMeetingPriorityInitial extends MorningMeetingPriorityState {}

final class MorningMeetingPriorityFailure extends MorningMeetingPriorityState {
  final String error;

  const MorningMeetingPriorityFailure({required this.error});
}

final class MorningMeetingPriorityLoading extends MorningMeetingPriorityState {}

final class MorningMeetingPrioritySuccess extends MorningMeetingPriorityState {
  final List<PriorityMorningMeetingEntity> pickup;
  final List<PriorityMorningMeetingEntity> delivery;

  const MorningMeetingPrioritySuccess({
    required this.pickup,
    required this.delivery,
  });
}

import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting/morning_meeting.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting_priority/morning_meeting_priority.dart';

abstract class MorningMeetingRepo {
  Future<Either<Failure, List<MorningMeeting>>> getMorningMeetingData(
      DateTime date);
  Future<Either<Failure, List<MorningMeetingPriority>>>
      getMorningMeetingPriorityData(DateTime date);
}

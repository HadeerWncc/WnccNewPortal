import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/morningMeating/data/models/morning_meeting/morning_meeting.dart';

abstract class MorningMeetingRepo {
  Future<Either<Failure, List<MorningMeeting>>> getMorningMeetingData(
      DateTime date);
}

import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/data_sources/morning_meeting_data_source.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting/morning_meeting.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting_priority/morning_meeting_priority.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/repos/morning_meeting_repo.dart';

class MorningMeetingRepoImpl extends MorningMeetingRepo {
  final MorningMeetingDataSource morningMeetingDataSource;

  MorningMeetingRepoImpl({required this.morningMeetingDataSource});

  @override
  Future<Either<Failure, List<MorningMeeting>>> getMorningMeetingData(
      DateTime date) async {
    try {
      List<MorningMeeting> morningMeetingList =
          await morningMeetingDataSource.getMorningMeetingData(date);
      return Right(morningMeetingList);
    } on Exception catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MorningMeetingPriority>>>
      getMorningMeetingPriorityData(DateTime date) async {
    try {
      List<MorningMeetingPriority> morningMeetingList =
          await morningMeetingDataSource.getMorningMeetingPriorityData(date);
      return Right(morningMeetingList);
    } on Exception catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting/morning_meeting.dart';

abstract class MorningMeetingDataSource {
  Future<List<MorningMeeting>> getMorningMeetingData(DateTime date);
}

class MorningMeetingDataSourceImpl extends MorningMeetingDataSource {
  final ApiService apiService;

  MorningMeetingDataSourceImpl({required this.apiService});

  @override
  Future<List<MorningMeeting>> getMorningMeetingData(DateTime date) async {
    var result = await apiService.get(
        endPoint: 'api/Reports/GetMorningMeeting?date=$date');
    List<MorningMeeting> morningMeetingList = [];
    for (var meeting in result["data"]) {
      MorningMeeting morningMeeting = MorningMeeting.fromJson(meeting);
      morningMeetingList.add(morningMeeting);
    }
    return morningMeetingList;
  }
}

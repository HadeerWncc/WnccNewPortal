import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting_priority/morning_meeting_priority.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/entities/priority_entity.dart';

List<PriorityMorningMeetingEntity> processPriorityEntities(
    List<MorningMeetingPriority> list, DateTime date, String type) {
  DateTime today = DateTime(date.year, date.month, date.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));

  // اجلب اليوم الحالي واليوم السابق
  List<MorningMeetingPriority> morningMeetingTwoDays = list.where((m) {
    if (m.date == null) return false;
    DateTime meetingDate = DateTime.parse(m.date!);
    meetingDate =
        DateTime(meetingDate.year, meetingDate.month, meetingDate.day);
    return meetingDate == today || meetingDate == yesterday;
  }).toList();
  morningMeetingTwoDays.sort((a, b) => a.date!.compareTo(b.date!));

  List<MorningMeetingPriority> sumationList = list
      .where((m) =>
          m.date != null &&
          DateTime.parse(m.date!).month == date.month &&
          DateTime.parse(m.date!).year == date.year)
      .toList();

  List<PriorityMorningMeetingEntity> priorityEntities =
      morningMeetingTwoDays.map((meeting) {
    return PriorityMorningMeetingEntity(
      date: DateFormat('MMM d, yyyy').format(DateTime.parse(meeting.date!)),
      bags: type == 'Pickup'
          ? meeting.pickup?.bags?.toDouble()
          : meeting.delivery?.bags?.toDouble(),
      bulk: type == 'Pickup'
          ? meeting.pickup?.bulk?.toDouble()
          : meeting.delivery?.bulk?.toDouble(),
    );
  }).toList();
  PriorityMorningMeetingEntity priorityEntity = PriorityMorningMeetingEntity(
    date: 'MTD',
    bags: double.parse(sumationList
        .fold<double>(
            0,
            (prev, e) =>
                prev +
                ((type == 'Pickup')
                    ? e.pickup?.bags ?? 0
                    : e.delivery?.bags ?? 0))
        .toStringAsFixed(2)),
    bulk: double.parse(sumationList
        .fold<double>(
            0,
            (prev, e) =>
                prev +
                ((type == 'Pickup')
                    ? e.pickup?.bulk ?? 0
                    : e.delivery?.bulk ?? 0))
        .toStringAsFixed(2)),
  );

  priorityEntities.add(priorityEntity);

  return priorityEntities;
}

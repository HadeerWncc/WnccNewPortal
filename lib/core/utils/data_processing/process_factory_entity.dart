import 'package:intl/intl.dart';
import 'package:wncc_portal/features/morningMeating/data/models/morning_meeting/morning_meeting.dart';
import 'package:wncc_portal/features/morningMeating/domain/entities/factory_entity.dart';

List<FactoryEntity> processFactoryEntities(
    List<MorningMeeting> list, DateTime date) {
  DateTime today = DateTime(date.year, date.month, date.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));

  // اجلب اليوم الحالي واليوم السابق
  List<MorningMeeting> morningMeetingTwoDays = list.where((m) {
    if (m.date == null) return false;
    DateTime meetingDate = DateTime(m.date!.year, m.date!.month, m.date!.day);
    return meetingDate == today || meetingDate == yesterday;
  }).toList();

  // اجلب كل اليوميات للشهر الحالي
  List<MorningMeeting> sumationList = list
      .where((m) =>
          m.date != null &&
          m.date!.month == date.month &&
          m.date!.year == date.year)
      .toList();

  // FactoryEntity لكل يوم
  List<FactoryEntity> factoryEntities = morningMeetingTwoDays.map((meeting) {
    return FactoryEntity(
      date: DateFormat('MMM d, yyyy').format(meeting.date!),
      bags: meeting.factoryDispatchResponse?.localBags?.toDouble(),
      bulk: meeting.factoryDispatchResponse?.bulk?.toDouble(),
      export: meeting.factoryDispatchResponse?.exports?.toDouble(),
      total: meeting.factoryDispatchResponse?.total?.toDouble(),
    );
  }).toList();
  factoryEntities = factoryEntities.reversed.toList();
  FactoryEntity factoryEntity = FactoryEntity(
    date: 'MTD',
    bags: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.factoryDispatchResponse?.localBags ?? 0))
        .toStringAsFixed(2)),
    bulk: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.factoryDispatchResponse?.bulk ?? 0))
        .toStringAsFixed(2)),
    export: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.factoryDispatchResponse?.exports ?? 0))
        .toStringAsFixed(2)),
    total: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.factoryDispatchResponse?.total ?? 0))
        .toStringAsFixed(2)),
  );

  factoryEntities.add(factoryEntity);

  return factoryEntities;
}

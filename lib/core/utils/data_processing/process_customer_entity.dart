import 'package:intl/intl.dart';
import 'package:wncc_portal/features/morningMeating/data/models/morning_meeting/morning_meeting.dart';
import 'package:wncc_portal/features/morningMeating/domain/entities/customer_dispatch_entity.dart';

List<CustomerDispatchEntity> processCustomerEntities(
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

  // CustomerDispatchEntity لكل يوم
  List<CustomerDispatchEntity> customerDispatchEntities =
      morningMeetingTwoDays.map((meeting) {
    final resp = meeting.customerDispatchResponse;
    return CustomerDispatchEntity(
      date: DateFormat('MMM d, yyyy').format(meeting.date!),
      bags: resp?.totalBags?.toDouble(),
      bulk: resp?.bulk?.toDouble(),
      export: (resp?.exportBags?.toDouble() ?? 0) +
          (resp?.exportBulk?.toDouble() ?? 0),
      total: resp?.total?.toDouble(),
      masry: resp?.masry?.toDouble(),
      wadi: resp?.wadie?.toDouble(),
      clincker: resp?.clinker?.toDouble(),
      expTrading: resp?.exportTrading?.toDouble(),
      totalExport: resp?.totalExport?.toDouble(),
      alltotal:
          (resp?.total?.toDouble() ?? 0) + (resp?.totalExport?.toDouble() ?? 0),
      extra: resp?.extra?.toDouble(),
    );
  }).toList();
  customerDispatchEntities = customerDispatchEntities.reversed.toList();
  // CustomerDispatchEntity للشهر كامل (MTD)
  CustomerDispatchEntity customerDispatchEntity = CustomerDispatchEntity(
    date: 'MTD',
    bags: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.totalBags ?? 0))
        .toStringAsFixed(2)),
    bulk: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.bulk ?? 0))
        .toStringAsFixed(2)),
    export: double.parse(sumationList
        .fold<double>(
            0,
            (prev, e) =>
                prev +
                ((e.customerDispatchResponse?.exportBags ?? 0) +
                    (e.customerDispatchResponse?.exportBulk ?? 0)))
        .toStringAsFixed(2)),
    total: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.total ?? 0))
        .toStringAsFixed(2)),
    masry: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.masry ?? 0))
        .toStringAsFixed(2)),
    wadi: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.wadie ?? 0))
        .toStringAsFixed(2)),
    clincker: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.clinker ?? 0))
        .toStringAsFixed(2)),
    expTrading: double.parse(sumationList
        .fold<double>(
            0,
            (prev, e) =>
                prev + (e.customerDispatchResponse?.exportTrading ?? 0))
        .toStringAsFixed(2)),
    totalExport: double.parse(sumationList
        .fold<double>(0,
            (prev, e) => prev + (e.customerDispatchResponse?.totalExport ?? 0))
        .toStringAsFixed(2)),
    alltotal: double.parse(sumationList
        .fold<double>(
            0,
            (prev, e) =>
                prev +
                ((e.customerDispatchResponse?.total ?? 0) +
                    (e.customerDispatchResponse?.totalExport ?? 0)))
        .toStringAsFixed(2)),
    extra: double.parse(sumationList
        .fold<double>(
            0, (prev, e) => prev + (e.customerDispatchResponse?.extra ?? 0))
        .toStringAsFixed(2)),
  );

  customerDispatchEntities.add(customerDispatchEntity);
  return customerDispatchEntities;
}

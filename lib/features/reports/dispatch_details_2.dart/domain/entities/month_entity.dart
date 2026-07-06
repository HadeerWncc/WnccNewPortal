import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/total_entity.dart';

class MonthEntity {
  String name;
  String date;
  TotalEntity totalEntity;

  MonthEntity(
      {required this.name, required this.date, required this.totalEntity});
}

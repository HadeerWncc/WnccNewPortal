import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_value_entity.dart';

class ValueDataEntity {
  int date;
  List<DispatchValueEntity> dispatches;
  ValueDataEntity({required this.date, required this.dispatches});
}

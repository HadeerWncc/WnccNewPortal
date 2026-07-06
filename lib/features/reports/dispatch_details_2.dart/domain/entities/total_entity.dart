import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_entity.dart';

class TotalEntity {
  String value;
  List<DispatchEntity>? dispatches;

  TotalEntity({required this.value, required this.dispatches});
}

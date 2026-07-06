import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_value_entity.dart';

class DispatchesRegionEntity {
  String id;
  String name;
  List<DispatchValueEntity> dispatches;

  DispatchesRegionEntity(
      {required this.id, required this.name, required this.dispatches});
}

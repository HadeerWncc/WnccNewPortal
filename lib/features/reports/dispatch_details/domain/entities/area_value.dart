import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/relation_value.dart';

class AreaValue {
  final String name;
  final List<RelationValue> regions;

  AreaValue({
    required this.name,
    required this.regions,
  });
}
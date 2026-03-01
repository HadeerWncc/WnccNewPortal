import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';

enum ColumnType {
  region,
  areaTotal,
}

class DispatchColumn {
  final String id;
  final String title;
  final String area;
  final ColumnType type;
  final DispatchRegion? region;

  DispatchColumn({
    required this.id,
    required this.title,
    required this.area,
    required this.type,
    this.region,
  });
}
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatches_region_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/month_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/total_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/value_data_entity.dart';

class DispatchDetailsEntity {
  String id;
  String name;
  String salesName;
  String salesId;
  String distributionChannelType;
  TotalEntity total;
  TotalEntity totalToday;
  String totalCheckedIn;
  String totalLoading;
  List<MonthEntity> months;
  List<ValueDataEntity> values;
  List<DispatchesRegionEntity> dispatches;
  String rank;

  DispatchDetailsEntity({
    required this.id,
    required this.name,
    required this.salesName,
    required this.salesId,
    required this.distributionChannelType,
    required this.total,
    required this.totalToday,
    required this.totalCheckedIn,
    required this.totalLoading,
    required this.months,
    required this.values,
    required this.dispatches,
    required this.rank,
  });
}

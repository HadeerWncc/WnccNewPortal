import 'package:wncc_portal/features/sales_quota/domain/entities/sales_quota_entity.dart';

class DailyQuotaEntity {
  final String id;
  final int totalQuota;
  final int totalBagsQuota;
  final int totalBulkQuota;
  final String date;
  final List<SalesQuotaEntity>? salesQuotas;
  DailyQuotaEntity({
    required this.id,
    required this.totalQuota,
    required this.totalBagsQuota,
    required this.totalBulkQuota,
    required this.date,
    required this.salesQuotas,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalQuota': totalQuota,
      'totalBagsQuota': totalBagsQuota,
      'totalBulkQuota': totalBulkQuota,
      'date': date,
      'salesQuotas': salesQuotas?.map((e) => e.toJson()).toList() ?? [],
    };
  }
}

import 'package:equatable/equatable.dart';
import 'sales_quota.dart';

class DailyQuotaModel extends Equatable {
  final dynamic id;
  final dynamic totalQuota;
  final dynamic totalBagsQuota;
  final dynamic totalBulkQuota;
  final String? date;
  final dynamic createdAt;
  final dynamic lastUpdatedAt;
  final bool? isDeleted;
  final dynamic createdBy;
  final List<SalesQuota>? salesQuotas;

  const DailyQuotaModel({
    this.id,
    this.totalQuota,
    this.totalBagsQuota,
    this.totalBulkQuota,
    this.date,
    this.createdAt,
    this.lastUpdatedAt,
    this.isDeleted,
    this.createdBy,
    this.salesQuotas,
  });

  factory DailyQuotaModel.fromJson(Map<String, dynamic> json) {
    return DailyQuotaModel(
      id: json['id'] as dynamic,
      totalQuota: json['totalQuota'] as dynamic,
      totalBagsQuota: json['totalBagsQuota'] as dynamic,
      totalBulkQuota: json['totalBulkQuota'] as dynamic,
      date: json['date'] as String?,
      createdAt: json['createdAt'] as dynamic,
      lastUpdatedAt: json['lastUpdatedAt'] as dynamic,
      isDeleted: json['isDeleted'] as bool?,
      createdBy: json['createdBy'] as dynamic,
      salesQuotas: (json['salesQuotas'] as List<dynamic>?)
          ?.map((e) => SalesQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'totalQuota': totalQuota,
        'totalBagsQuota': totalBagsQuota,
        'totalBulkQuota': totalBulkQuota,
        'date': date,
        'createdAt': createdAt,
        'lastUpdatedAt': lastUpdatedAt,
        'isDeleted': isDeleted,
        'createdBy': createdBy,
        'salesQuotas': salesQuotas?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      totalQuota,
      totalBagsQuota,
      totalBulkQuota,
      date,
      createdAt,
      lastUpdatedAt,
      isDeleted,
      createdBy,
      salesQuotas,
    ];
  }
}

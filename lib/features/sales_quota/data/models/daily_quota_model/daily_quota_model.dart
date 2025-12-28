import 'package:equatable/equatable.dart';

import 'sales_quota.dart';

class DailyQuotaModel extends Equatable {
  final String? id;
  final num totalQuota;
  final num totalBagsQuota;
  final num totalBulkQuota;
  final String? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final bool? isDistributed;
  final bool? isDeleted;
  final List<SalesQuota>? salesQuotas;

  const DailyQuotaModel({
    this.id,
    required this.totalQuota,
    required this.totalBagsQuota,
    required this.totalBulkQuota,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.isDistributed,
    this.isDeleted,
    this.salesQuotas,
  });

  factory DailyQuotaModel.fromJson(Map<String, dynamic> json) {
    return DailyQuotaModel(
      id: json['id'] as String?,
      totalQuota: json['totalQuota'] as num,
      totalBagsQuota: json['totalBagsQuota'] as num,
      totalBulkQuota: json['totalBulkQuota'] as num,
      date: json['date'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'] as dynamic,
      updatedBy: json['updatedBy'] as dynamic,
      isDistributed: json['isDistributed'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
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
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'createdBy': createdBy,
        'updatedBy': updatedBy,
        'isDistributed': isDistributed,
        'isDeleted': isDeleted,
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
      updatedAt,
      createdBy,
      updatedBy,
      isDistributed,
      isDeleted,
      salesQuotas,
    ];
  }
}

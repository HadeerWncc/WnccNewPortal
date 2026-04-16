import 'package:equatable/equatable.dart';

class PrioritySummaryModel extends Equatable {
  final num? totalBagsQuota;
  final num? totalBulkQuota;
  final num? totalBagsPriority;
  final num? totalBulkPriority;
  final num? totalBagsDispatch;
  final num? totalBulkDispatch;
  final num? totalBulkExtraQuota;
  final num? totalBagsExtraQuota;
  final num? totalBagsPending;
  final num? totalBulkPending;
  final num? totalQuota;

  const PrioritySummaryModel({
    this.totalBagsQuota,
    this.totalBulkQuota,
    this.totalBagsPriority,
    this.totalBulkPriority,
    this.totalBagsDispatch,
    this.totalBulkDispatch,
    this.totalBulkExtraQuota,
    this.totalBagsExtraQuota,
    this.totalBagsPending,
    this.totalBulkPending,
    this.totalQuota,
  });

  factory PrioritySummaryModel.fromJson(Map<String, dynamic> json) {
    return PrioritySummaryModel(
      totalBagsQuota: json['totalBagsQuota'] as num?,
      totalBulkQuota: json['totalBulkQuota'] as num?,
      totalBagsPriority: json['totalBagsPriority'] as num?,
      totalBulkPriority: json['totalBulkPriority'] as num?,
      totalBagsDispatch: json['totalBagsDispatch'] as num?,
      totalBulkDispatch: json['totalBulkDispatch'] as num?,
      totalBulkExtraQuota: json['totalBulkExtraQuota'] as num?,
      totalBagsExtraQuota: json['totalBagsExtraQuota'] as num?,
      totalBagsPending: json['totalBagsPending'] as num?,
      totalBulkPending: json['totalBulkPending'] as num?,
      totalQuota: json['totalQuota'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'totalBagsQuota': totalBagsQuota,
        'totalBulkQuota': totalBulkQuota,
        'totalBagsPriority': totalBagsPriority,
        'totalBulkPriority': totalBulkPriority,
        'totalBagsDispatch': totalBagsDispatch,
        'totalBulkDispatch': totalBulkDispatch,
        'totalBulkExtraQuota': totalBulkExtraQuota,
        'totalBagsExtraQuota': totalBagsExtraQuota,
        'totalBagsPending': totalBagsPending,
        'totalBulkPending': totalBulkPending,
        'totalQuota': totalQuota,
      };

  @override
  List<Object?> get props {
    return [
      totalBagsQuota,
      totalBulkQuota,
      totalBagsPriority,
      totalBulkPriority,
      totalBagsDispatch,
      totalBulkDispatch,
      totalBulkExtraQuota,
      totalBagsExtraQuota,
      totalBagsPending,
      totalBulkPending,
      totalQuota,
    ];
  }
}

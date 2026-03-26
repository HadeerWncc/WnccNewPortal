import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_quantity.dart';

class DispatchPerSalesModel extends Equatable {
  final String? salesId;
  final String? salesName;
  final String? branchRegionDesc;
  final DispatchQuantity? totalBulk;
  final DispatchQuantity? totalBags;
  final DispatchQuantity? total;
  final DispatchQuantity? totalMonthly;
  final DispatchQuantity? totalDaily;

  const DispatchPerSalesModel({
    this.salesId,
    this.salesName,
    this.branchRegionDesc,
    this.totalBulk,
    this.totalBags,
    this.total,
    this.totalMonthly,
    this.totalDaily,
  });

  factory DispatchPerSalesModel.fromJson(Map<String, dynamic> json) {
    return DispatchPerSalesModel(
      salesId: json['salesId'] as String?,
      salesName: json['salesName'] as String?,
      branchRegionDesc: json['branchRegionDesc'] as String?,
      totalBulk: json['totalBulk'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalBulk'] as Map<String, dynamic>),
      totalBags: json['totalBags'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalBags'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : DispatchQuantity.fromJson(json['total'] as Map<String, dynamic>),
      totalMonthly: json['totalMonthly'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalMonthly'] as Map<String, dynamic>),
      totalDaily: json['totalDaily'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalDaily'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'salesId': salesId,
        'salesName': salesName,
        'branchRegionDesc': branchRegionDesc,
        'totalBulk': totalBulk?.toJson(),
        'totalBags': totalBags?.toJson(),
        'total': total?.toJson(),
        'totalMonthly': totalMonthly?.toJson(),
        'totalDaily': totalDaily?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      salesId,
      salesName,
      branchRegionDesc,
      totalBulk,
      totalBags,
      total,
      totalMonthly,
      totalDaily,
    ];
  }
}

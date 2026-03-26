import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_quantity.dart';

class DispatchPerCustomerModel extends Equatable {
  final String? customerId;
  final String? customerName;
  final String? customerRegion;
  final String? branchRegionDesc;
  final String? salesName;
  final DispatchQuantity? totalBulk;
  final DispatchQuantity? totalBags;
  final DispatchQuantity? total;
  final DispatchQuantity? totalDaily;
  final DispatchQuantity? totalMonthly;

  const DispatchPerCustomerModel({
    this.customerId,
    this.customerName,
    this.customerRegion,
    this.branchRegionDesc,
    this.salesName,
    this.totalBulk,
    this.totalBags,
    this.total,
    this.totalDaily,
    this.totalMonthly,
  });

  factory DispatchPerCustomerModel.fromJson(Map<String, dynamic> json) {
    return DispatchPerCustomerModel(
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      customerRegion: json['customerRegion'] as String?,
      branchRegionDesc: json['branchRegionDesc'] as String?,
      salesName: json['salesName'] as String?,
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
      totalDaily: json['totalDaily'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalDaily'] as Map<String, dynamic>),
      totalMonthly: json['totalMonthly'] == null
          ? null
          : DispatchQuantity.fromJson(
              json['totalMonthly'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'customerName': customerName,
        'customerRegion': customerRegion,
        'branchRegionDesc': branchRegionDesc,
        'salesName': salesName,
        'totalBulk': totalBulk?.toJson(),
        'totalBags': totalBags?.toJson(),
        'total': total?.toJson(),
        'totalDaily': totalDaily?.toJson(),
        'totalMonthly': totalMonthly?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      customerId,
      customerName,
      customerRegion,
      branchRegionDesc,
      salesName,
      totalBulk,
      totalBags,
      total,
      totalDaily,
      totalMonthly,
    ];
  }
}

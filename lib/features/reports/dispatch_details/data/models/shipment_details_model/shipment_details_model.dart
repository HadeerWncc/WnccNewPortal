import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';


class ShipmentDetailsModel extends Equatable {
  final String? status;
  final DispatchQuantity? totalBulk;
  final DispatchQuantity? totalBags;
  final DispatchQuantity? totalDelta;
  final DispatchQuantity? totalGCairo;
  final DispatchQuantity? totalUEgypt;
  final DispatchQuantity? totalCostal;
  final DispatchQuantity? total;
  final DispatchQuantity? totalExport;
  final List<DispatchRegion>? regions;

  const ShipmentDetailsModel({
    this.status,
    this.totalBulk,
    this.totalBags,
    this.totalDelta,
    this.totalGCairo,
    this.totalUEgypt,
    this.totalCostal,
    this.total,
    this.totalExport,
    this.regions,
  });

  factory ShipmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShipmentDetailsModel(
      status: json['status'] as String?,
      totalBulk: json['totalBulk'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalBulk'] as Map<String, dynamic>),
      totalBags: json['totalBags'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalBags'] as Map<String, dynamic>),
      totalDelta: json['totalDelta'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalDelta'] as Map<String, dynamic>),
      totalGCairo: json['totalGCairo'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalGCairo'] as Map<String, dynamic>),
      totalUEgypt: json['totalUEgypt'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalUEgypt'] as Map<String, dynamic>),
      totalCostal: json['totalCostal'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalCostal'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : DispatchQuantity.fromJson(json['total'] as Map<String, dynamic>),
      totalExport: json['totalExport'] == null
          ? null
          : DispatchQuantity.fromJson(json['totalExport'] as Map<String, dynamic>),
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => DispatchRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalBulk': totalBulk?.toJson(),
        'totalBags': totalBags?.toJson(),
        'totalDelta': totalDelta?.toJson(),
        'totalGCairo': totalGCairo?.toJson(),
        'totalUEgypt': totalUEgypt?.toJson(),
        'totalCostal': totalCostal?.toJson(),
        'total': total?.toJson(),
        'totalExport': totalExport?.toJson(),
        'regions': regions?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      status,
      totalBulk,
      totalBags,
      totalDelta,
      totalGCairo,
      totalUEgypt,
      totalCostal,
      total,
      totalExport,
      regions,
    ];
  }
}

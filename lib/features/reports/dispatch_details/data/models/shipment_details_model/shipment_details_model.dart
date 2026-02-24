import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/region.dart';

class ShipmentDetailsModel extends Equatable {
  final String? status;
  final int? totalBulk;
  final int? totalBags;
  final int? totalDelta;
  final int? total;
  final int? totalExport;
  final List<Region>? regions;

  const ShipmentDetailsModel({
    this.status,
    this.totalBulk,
    this.totalBags,
    this.totalDelta,
    this.total,
    this.totalExport,
    this.regions,
  });

  factory ShipmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShipmentDetailsModel(
      status: json['status'] as String?,
      totalBulk: json['totalBulk'] as int?,
      totalBags: json['totalBags'] as int?,
      totalDelta: json['totalDelta'] as int?,
      total: json['total'] as int?,
      totalExport: json['totalExport'] as int?,
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalBulk': totalBulk,
        'totalBags': totalBags,
        'totalDelta': totalDelta,
        'total': total,
        'totalExport': totalExport,
        'regions': regions?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      status,
      totalBulk,
      totalBags,
      totalDelta,
      total,
      totalExport,
      regions,
    ];
  }
}

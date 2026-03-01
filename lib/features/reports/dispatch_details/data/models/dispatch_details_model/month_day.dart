import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';


class MonthDay extends Equatable {
  final String? date;
  final bool? isToday;
  final DispatchQuantity? totalBulk;
  final DispatchQuantity? totalBags;
  final DispatchQuantity? totalDelta;
  final DispatchQuantity? totalGCairo;
  final DispatchQuantity? totalUEgypt;
  final DispatchQuantity? totalCoastal;
  final DispatchQuantity? total;
  final DispatchQuantity? totalExport;
  final List<DispatchRegion>? regions;

  const MonthDay({
    this.date,
    this.isToday,
    this.totalBulk,
    this.totalBags,
    this.totalDelta,
    this.totalGCairo,
    this.totalUEgypt,
    this.totalCoastal,
    this.total,
    this.totalExport,
    this.regions,
  });

  factory MonthDay.fromJson(Map<String, dynamic> json) => MonthDay(
        date: json['date'] as String?,
        isToday: json['isToday'] as bool?,
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
        totalCoastal: json['totalCoastal'] == null
            ? null
            : DispatchQuantity.fromJson(
                json['totalCoastal'] as Map<String, dynamic>),
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

  Map<String, dynamic> toJson() => {
        'date': date,
        'isToday': isToday,
        'totalBulk': totalBulk?.toJson(),
        'totalBags': totalBags?.toJson(),
        'totalDelta': totalDelta?.toJson(),
        'totalGCairo': totalGCairo?.toJson(),
        'totalUEgypt': totalUEgypt?.toJson(),
        'totalCoastal': totalCoastal?.toJson(),
        'total': total?.toJson(),
        'totalExport': totalExport?.toJson(),
        'regions': regions?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      date,
      isToday,
      totalBulk,
      totalBags,
      totalDelta,
      totalGCairo,
      totalUEgypt,
      totalCoastal,
      total,
      totalExport,
      regions,
    ];
  }
}

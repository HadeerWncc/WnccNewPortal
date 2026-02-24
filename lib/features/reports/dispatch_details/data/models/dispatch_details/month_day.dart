import 'package:equatable/equatable.dart';

import 'region.dart';

class MonthDay extends Equatable {
  final String? date;
  final double? totalBulk;
  final int? totalBags;
  final double? totalDelta;
  final double? total;
  final int? totalExport;
  final List<Region>? regions;

  const MonthDay({
    this.date,
    this.totalBulk,
    this.totalBags,
    this.totalDelta,
    this.total,
    this.totalExport,
    this.regions,
  });

  factory MonthDay.fromJson(Map<String, dynamic> json) => MonthDay(
        date: json['date'] as String?,
        totalBulk: (json['totalBulk'] as num?)?.toDouble(),
        totalBags: json['totalBags'] as int?,
        totalDelta: (json['totalDelta'] as num?)?.toDouble(),
        total: (json['total'] as num?)?.toDouble(),
        totalExport: json['totalExport'] as int?,
        regions: (json['regions'] as List<dynamic>?)
            ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
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
      date,
      totalBulk,
      totalBags,
      totalDelta,
      total,
      totalExport,
      regions,
    ];
  }
}

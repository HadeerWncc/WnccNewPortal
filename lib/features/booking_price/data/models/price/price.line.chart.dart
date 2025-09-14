import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/region.dart';

import 'price_range.line.chart.dart';

class Price extends Equatable {
  final List<PriceRange>? priceRanges;
  final List<Region>? regions;
  final List<dynamic>? payers;
  final List<dynamic>? rows;

  const Price({this.priceRanges, this.regions, this.payers, this.rows});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        priceRanges: (json['priceRanges'] as List<dynamic>?)
            ?.map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
            .toList(),
        regions: (json['regions'] as List<dynamic>?)
            ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
            .toList(),
        payers: json['payers'] as List<dynamic>?,
        rows: json['rows'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'priceRanges': priceRanges?.map((e) => e.toJson()).toList(),
        'regions': regions?.map((e) => e.toJson()).toList(),
        'payers': payers,
        'rows': rows,
      };

  @override
  List<Object?> get props => [priceRanges, regions, payers, rows];
}

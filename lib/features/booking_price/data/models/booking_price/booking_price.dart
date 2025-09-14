import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/region.dart';

import 'payer.dart';
import 'price_range.dart';
import 'row.dart';

class BookingPrice extends Equatable {
  final List<PriceRange>? priceRanges;
  final List<Region>? regions;
  final List<Payer>? payers;
  final List<Row>? rows;

  const BookingPrice({
    this.priceRanges,
    this.regions,
    this.payers,
    this.rows,
  });

  factory BookingPrice.fromJson(Map<String, dynamic> json) => BookingPrice(
        priceRanges: (json['priceRanges'] as List<dynamic>?)
            ?.map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
            .toList(),
        regions: (json['regions'] as List<dynamic>?)
            ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
            .toList(),
        payers: (json['payers'] as List<dynamic>?)
            ?.map((e) => Payer.fromJson(e as Map<String, dynamic>))
            .toList(),
        rows: (json['rows'] as List<dynamic>?)
            ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'priceRanges': priceRanges?.map((e) => e.toJson()).toList(),
        'regions': regions?.map((e) => e.toJson()).toList(),
        'payers': payers?.map((e) => e.toJson()).toList(),
        'rows': rows?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [priceRanges, regions, payers, rows];
}

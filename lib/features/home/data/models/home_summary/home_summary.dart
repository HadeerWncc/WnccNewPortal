import 'package:equatable/equatable.dart';

import 'sales_datum.dart';

class HomeSummary extends Equatable {
  final List<SalesDatum>? salesData;

  const HomeSummary({this.salesData});

  factory HomeSummary.fromJson(Map<String, dynamic> json) => HomeSummary(
        salesData: (json['salesData'] as List<dynamic>?)
            ?.map((e) => SalesDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'salesData': salesData?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [salesData];
}

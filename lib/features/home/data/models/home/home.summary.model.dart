import 'package:equatable/equatable.dart';

import 'sales_datum.summary.model.dart';

class Home extends Equatable {
  final List<SalesDatum>? salesData;

  const Home({this.salesData});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
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

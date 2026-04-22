import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_quantity.dart';

import 'data_value.dart';

class MonthDay extends Equatable {
  final String? date;
  final DispatchQuantity? total;
  final double? totalExport;
  final List<DataValue>? dataValues;

  const MonthDay({
    this.date,
    this.total,
    this.totalExport,
    this.dataValues,
  });

  factory MonthDay.fromJson(Map<String, dynamic> json) => MonthDay(
        date: json['date'] as String?,
        total: json['total'] == null
            ? null
            : DispatchQuantity.fromJson(json['total'] as Map<String, dynamic>),
        totalExport: (json['totalExport'] as num?)?.toDouble(),
        dataValues: (json['dataValues'] as List<dynamic>?)
            ?.map((e) => DataValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'total': total?.toJson(),
        'totalExport': totalExport,
        'dataValues': dataValues?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [date, total, totalExport, dataValues];
}

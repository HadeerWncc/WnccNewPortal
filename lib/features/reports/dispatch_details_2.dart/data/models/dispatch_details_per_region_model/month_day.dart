import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';

import 'data_value.dart';

class MonthDay extends Equatable {
  final String? date;
  final Value? total;
  final num? totalExport;
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
            : Value.fromJson(json['total'] as Map<String, dynamic>),
        totalExport: json['totalExport'] as num?,
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

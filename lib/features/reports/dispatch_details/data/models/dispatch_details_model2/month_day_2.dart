import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model2/dispatch_details_quantity.dart';

import 'data_value.dart';
import 'total.dart';

class MonthDay2 extends Equatable {
  final String? date;
  final DispatchDetailsQuantity? total;
  final num? totalExport;
  final List<DataValue>? dataValues;

  const MonthDay2({
    this.date,
    this.total,
    this.totalExport,
    this.dataValues,
  });

  factory MonthDay2.fromJson(Map<String, dynamic> json) => MonthDay2(
        date: json['date'] as String?,
        total: json['total'] == null
            ? null
            : DispatchDetailsQuantity.fromJson(
                json['total'] as Map<String, dynamic>),
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

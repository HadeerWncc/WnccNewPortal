import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatches_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/values_date.dart';

import 'month.dart';
import 'total.dart';
import 'value.dart';

class DispatchDetailsVsModel extends Equatable {
  final String? id;
  final String? name;
  final dynamic salesName;
  final Total? total;
  final Total? totalToday;
  final Value? totalCheckedIn;
  final Value? totalLoading;
  final List<Month>? months;
  final List<ValuesDate>? values;
  final List<DispatchesRegion>? dispatches;
  final int? rank;

  const DispatchDetailsVsModel({
    this.id,
    this.name,
    this.salesName,
    this.total,
    this.totalToday,
    this.totalCheckedIn,
    this.totalLoading,
    this.months,
    this.values,
    this.dispatches,
    this.rank,
  });

  factory DispatchDetailsVsModel.fromJson(Map<String, dynamic> json) {
    return DispatchDetailsVsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      salesName: json['salesName'] as dynamic,
      total: json['total'] == null
          ? null
          : Total.fromJson(json['total'] as Map<String, dynamic>),
      totalToday: json['totalToday'] == null
          ? null
          : Total.fromJson(json['totalToday'] as Map<String, dynamic>),
      totalCheckedIn: json['totalCheckedIn'] == null
          ? null
          : Value.fromJson(
              json['totalCheckedIn'] as Map<String, dynamic>),
      totalLoading: json['totalLoading'] == null
          ? null
          : Value.fromJson(json['totalLoading'] as Map<String, dynamic>),
      months: (json['months'] as List<dynamic>?)
          ?.map((e) => Month.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ValuesDate.fromJson(e as Map<String, dynamic>))
          .toList(),
      dispatches: (json['dispatches'] as List<dynamic>?)
          ?.map((e) => DispatchesRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      rank: json['rank'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'salesName': salesName,
        'total': total?.toJson(),
        'totalToday': totalToday?.toJson(),
        'totalCheckedIn': totalCheckedIn?.toJson(),
        'totalLoading': totalLoading?.toJson(),
        'months': months?.map((e) => e.toJson()).toList(),
        'values': values?.map((e) => e.toJson()).toList(),
        'dispatches': dispatches?.map((e) => e.toJson()).toList(),
        'rank': rank,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      salesName,
      total,
      totalToday,
      totalCheckedIn,
      totalLoading,
      months,
      values,
      dispatches,
      rank,
    ];
  }
}

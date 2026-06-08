import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch.dart';

import 'value.dart';

class TotalToday extends Equatable {
  final Value? value;
  final List<Dispatch>? dispatches;

  const TotalToday({this.value, this.dispatches});

  factory TotalToday.fromJson(Map<String, dynamic> json) => TotalToday(
        value: json['value'] == null
            ? null
            : Value.fromJson(json['value'] as Map<String, dynamic>),
        dispatches: json['dispatches'] as List<Dispatch>?,
      );

  Map<String, dynamic> toJson() => {
        'value': value?.toJson(),
        'dispatches': dispatches,
      };

  @override
  List<Object?> get props => [value, dispatches];
}

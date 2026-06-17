import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/disptch_value.dart';

class ValuesDate extends Equatable {
  final int? date;
  final List<DispatchValue>? dispatches;

  const ValuesDate({this.date, this.dispatches});

  factory ValuesDate.fromJson(Map<String, dynamic> json) => ValuesDate(
        date: (json['date'] as num?)?.toInt(),
        dispatches: (json['dispatches'] as List<dynamic>?)
            ?.map((e) => DispatchValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'dispatches': dispatches?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [date, dispatches];
}

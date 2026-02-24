import 'package:equatable/equatable.dart';

import 'month_day.dart';

class DispatchDetails extends Equatable {
  final int? month;
  final dynamic monthLabel;
  final List<MonthDay>? monthDays;

  const DispatchDetails({this.month, this.monthLabel, this.monthDays});

  factory DispatchDetails.fromJson(Map<String, dynamic> json) {
    return DispatchDetails(
      month: json['month'] as int?,
      monthLabel: json['monthLabel'] as dynamic,
      monthDays: (json['monthDays'] as List<dynamic>?)
          ?.map((e) => MonthDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'month': month,
        'monthLabel': monthLabel,
        'monthDays': monthDays?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [month, monthLabel, monthDays];
}

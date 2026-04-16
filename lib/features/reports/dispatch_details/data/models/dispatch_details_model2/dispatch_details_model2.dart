import 'package:equatable/equatable.dart';

import 'month_day_2.dart';

class DispatchDetailsModel2 extends Equatable {
  final String? monthDate;
  final List<MonthDay2>? monthDays;

  const DispatchDetailsModel2({this.monthDate, this.monthDays});

  factory DispatchDetailsModel2.fromJson(Map<String, dynamic> json) {
    return DispatchDetailsModel2(
      monthDate: json['monthDate'] as String?,
      monthDays: (json['monthDays'] as List<dynamic>?)
          ?.map((e) => MonthDay2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'monthDate': monthDate,
        'monthDays': monthDays?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [monthDate, monthDays];
}

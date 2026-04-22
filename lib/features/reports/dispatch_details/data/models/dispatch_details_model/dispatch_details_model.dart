import 'package:equatable/equatable.dart';

import 'month_day.dart';

class DispatchDetailsModel extends Equatable {
  final String? monthDate;
  final List<MonthDay>? monthDays;

  const DispatchDetailsModel({this.monthDate, this.monthDays});

  factory DispatchDetailsModel.fromJson(Map<String, dynamic> json) {
    return DispatchDetailsModel(
      monthDate: json['monthDate'] as String?,
      monthDays: (json['monthDays'] as List<dynamic>?)
          ?.map((e) => MonthDay.fromJson(e as Map<String, dynamic>))
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

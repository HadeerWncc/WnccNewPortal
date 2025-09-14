import 'package:equatable/equatable.dart';

class PriceRange extends Equatable {
  final String? fromDate;
  final String? toDate;

  const PriceRange({this.fromDate, this.toDate});

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        fromDate: json['fromDate'] as String?,
        toDate: json['toDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fromDate': fromDate,
        'toDate': toDate,
      };

  @override
  List<Object?> get props => [fromDate, toDate];
}

import 'package:equatable/equatable.dart';

import 'customer_dispatch_response.dart';

class FactCompareItem extends Equatable {
  final String? date;
  final int? month;
  final CustomerDispatchResponse? customerDispatchResponse;

  const FactCompareItem({this.date, this.month, this.customerDispatchResponse});

  factory FactCompareItem.fromJson(Map<String, dynamic> json) => FactCompareItem(
        date: json['date'] as String?,
        month: json['month'] as int?,
        customerDispatchResponse: json['customerDispatchResponse'] == null
            ? null
            : CustomerDispatchResponse.fromJson(
                json['customerDispatchResponse'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'month': month,
        'customerDispatchResponse': customerDispatchResponse?.toJson(),
      };

  @override
  List<Object?> get props => [date, month, customerDispatchResponse];
}

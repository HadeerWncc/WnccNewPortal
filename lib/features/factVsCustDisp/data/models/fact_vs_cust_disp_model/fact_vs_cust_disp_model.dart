import 'package:equatable/equatable.dart';

import 'customer_dispatch_response.dart';
import 'factory_dispatch_response.dart';

class FactVsCustDispModel extends Equatable {
  final int? hour;
  final dynamic day;
  final dynamic month;
  final dynamic date;
  final String? displayDate;
  final CustomerDispatchResponse customerDispatchResponse;
  final FactoryDispatchResponse factoryDispatchResponse;

  const FactVsCustDispModel({
    this.hour,
    this.day,
    this.month,
    this.date,
    this.displayDate,
    required this.customerDispatchResponse,
    required this.factoryDispatchResponse,
  });

  factory FactVsCustDispModel.fromJson(Map<String, dynamic> json) {
    return FactVsCustDispModel(
      hour: json['hour'] as int?,
      day: json['day'] as dynamic,
      month: json['month'] as dynamic,
      date: json['date'] as dynamic,
      displayDate: json['displayDate'] as String?,
      customerDispatchResponse: CustomerDispatchResponse.fromJson(
          json['customerDispatchResponse'] as Map<String, dynamic>),
      factoryDispatchResponse: FactoryDispatchResponse.fromJson(
          json['factoryDispatchResponse'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'day': day,
        'month': month,
        'date': date,
        'displayDate': displayDate,
        'customerDispatchResponse': customerDispatchResponse.toJson(),
        'factoryDispatchResponse': factoryDispatchResponse.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      hour,
      day,
      month,
      date,
      displayDate,
      customerDispatchResponse,
      factoryDispatchResponse,
    ];
  }
}

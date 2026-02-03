import 'package:equatable/equatable.dart';

import 'customer_dispatch_response.dart';
import 'factory_dispatch_response.dart';

class MorningMeeting extends Equatable {
  final DateTime? date;
  final FactoryDispatchResponse? factoryDispatchResponse;
  final CustomerDispatchResponse? customerDispatchResponse;

  const MorningMeeting({
    this.date,
    this.factoryDispatchResponse,
    this.customerDispatchResponse,
  });

  factory MorningMeeting.fromJson(Map<String, dynamic> json) {
    return MorningMeeting(
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      factoryDispatchResponse: json['factoryDispatchResponse'] == null
          ? null
          : FactoryDispatchResponse.fromJson(
              json['factoryDispatchResponse'] as Map<String, dynamic>),
      customerDispatchResponse: json['customerDispatchResponse'] == null
          ? null
          : CustomerDispatchResponse.fromJson(
              json['customerDispatchResponse'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'factoryDispatchResponse': factoryDispatchResponse?.toJson(),
        'customerDispatchResponse': customerDispatchResponse?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      date,
      factoryDispatchResponse,
      customerDispatchResponse,
    ];
  }
}

import 'package:equatable/equatable.dart';

import 'all_months_detail.dart';
import 'month_details.dart';

class PayerMonthlyDetails extends Equatable {
  final String? id;
  final MonthDetails? monthDetails;
  final List<AllMonthsDetail>? allMonthsDetails;
  final String? lastOrderAt;
  final DateTime? lastPaymentAt;

  const PayerMonthlyDetails({
    this.id,
    this.monthDetails,
    this.allMonthsDetails,
    this.lastOrderAt,
    this.lastPaymentAt,
  });

  factory PayerMonthlyDetails.fromJson(Map<String, dynamic> json) {
    return PayerMonthlyDetails(
      id: json['id'] as String?,
      monthDetails: json['monthDetails'] == null
          ? null
          : MonthDetails.fromJson(json['monthDetails'] as Map<String, dynamic>),
      allMonthsDetails: (json['allMonthsDetails'] as List<dynamic>?)
          ?.map((e) => AllMonthsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastOrderAt: json['lastOrderAt'] as String?,
      lastPaymentAt: json['lastPaymentAt'] == null
          ? null
          : DateTime.parse(json['lastPaymentAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'monthDetails': monthDetails?.toJson(),
        'allMonthsDetails': allMonthsDetails?.map((e) => e.toJson()).toList(),
        'lastOrderAt': lastOrderAt,
        'lastPaymentAt': lastPaymentAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      monthDetails,
      allMonthsDetails,
      lastOrderAt,
      lastPaymentAt,
    ];
  }
}

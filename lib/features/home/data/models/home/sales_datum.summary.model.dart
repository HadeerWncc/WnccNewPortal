import 'package:equatable/equatable.dart';

import 'quota.summary.model.dart';

class SalesDatum extends Equatable {
  final String? id;
  final String? salesName;
  final Quota? quota;
  final Quota? priority;
  final Quota? dispatch;
  final Quota? pending;
  final num? dailyPayment;
  final num? monthlyPayment;
  final int? dailyPaymentCount;
  final Quota? loading;
  final Quota? checked;

  const SalesDatum({
    this.id,
    this.salesName,
    this.quota,
    this.priority,
    this.dispatch,
    this.pending,
    this.dailyPayment,
    this.monthlyPayment,
    this.dailyPaymentCount,
    this.loading,
    this.checked,
  });

  factory SalesDatum.fromJson(Map<String, dynamic> json) => SalesDatum(
        id: json['id'] as String?,
        salesName: json['salesName'] as String?,
        quota: json['quota'] == null
            ? null
            : Quota.fromJson(json['quota'] as Map<String, dynamic>),
        priority: json['priority'] == null
            ? null
            : Quota.fromJson(json['priority'] as Map<String, dynamic>),
        dispatch: json['dispatch'] == null
            ? null
            : Quota.fromJson(json['dispatch'] as Map<String, dynamic>),
        pending: json['pending'] == null
            ? null
            : Quota.fromJson(json['pending'] as Map<String, dynamic>),
        dailyPayment: json['dailyPayment'] as num?,
        monthlyPayment: json['monthlyPayment'] as num?,
        dailyPaymentCount: json['dailyPaymentCount'] as int?,
        loading: json['loading'] == null
            ? null
            : Quota.fromJson(json['loading'] as Map<String, dynamic>),
        checked: json['checked'] == null
            ? null
            : Quota.fromJson(json['checked'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'salesName': salesName,
        'quota': quota?.toJson(),
        'priority': priority?.toJson(),
        'dispatch': dispatch?.toJson(),
        'pending': pending?.toJson(),
        'dailyPayment': dailyPayment,
        'monthlyPayment': monthlyPayment,
        'dailyPaymentCount': dailyPaymentCount,
        'loading': loading?.toJson(),
        'checked': checked?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      salesName,
      quota,
      priority,
      dispatch,
      pending,
      dailyPayment,
      monthlyPayment,
      dailyPaymentCount,
      loading,
      checked,
    ];
  }
}

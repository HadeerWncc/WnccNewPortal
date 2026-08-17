import 'package:equatable/equatable.dart';

import 'month_dispatch.dart';
import 'payment.dart';
import 'quota.dart';

class SalesDatum extends Equatable {
  final String? id;
  final String? salesName;
  final Quota? quota;
  final Quota? priority;
  final Quota? dispatch;
  final Quota? pending;
  final List<Payment>? payments;
  final num? loading;
  final num? checked;
  final num? shipmentTruck;
  final List<MonthDispatch>? monthDispatches;

  const SalesDatum({
    this.id,
    this.salesName,
    this.quota,
    this.priority,
    this.dispatch,
    this.pending,
    this.payments,
    this.loading,
    this.checked,
    this.shipmentTruck,
    this.monthDispatches,
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
        payments: (json['payments'] as List<dynamic>?)
            ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
            .toList(),
        loading: json['loading'] as num?,
        checked: json['checked'] as num?,
        shipmentTruck: json['shipmentTruck'] as num?,
        monthDispatches: (json['monthDispatches'] as List<dynamic>?)
            ?.map((e) => MonthDispatch.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'salesName': salesName,
        'quota': quota?.toJson(),
        'priority': priority?.toJson(),
        'dispatch': dispatch?.toJson(),
        'pending': pending?.toJson(),
        'payments': payments?.map((e) => e.toJson()).toList(),
        'loading': loading,
        'checked': checked,
        'shipmentTruck': shipmentTruck,
        'monthDispatches': monthDispatches?.map((e) => e.toJson()).toList(),
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
      payments,
      loading,
      checked,
      shipmentTruck,
      monthDispatches,
    ];
  }
}

import 'package:equatable/equatable.dart';

import 'month_target.dart';

class PayerTarget extends Equatable {
  final String? id;
  final MonthTarget? monthTarget;
  final double? rate;

  const PayerTarget({this.id, this.monthTarget, this.rate});

  factory PayerTarget.fromJson(Map<String, dynamic> json) => PayerTarget(
        id: json['id'] as String?,
        monthTarget: json['monthTarget'] == null
            ? null
            : MonthTarget.fromJson(json['monthTarget'] as Map<String, dynamic>),
        rate: (json['rate'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'monthTarget': monthTarget?.toJson(),
        'rate': rate,
      };

  @override
  List<Object?> get props => [id, monthTarget, rate];
}

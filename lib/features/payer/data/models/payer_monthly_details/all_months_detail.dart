import 'package:equatable/equatable.dart';

import 'quantity.dart';

class AllMonthsDetail extends Equatable {
  final Quantity? quantity;
  final int? ammount;
  final int? rate;
  final String? month;

  const AllMonthsDetail({
    this.quantity,
    this.ammount,
    this.rate,
    this.month,
  });

  factory AllMonthsDetail.fromJson(Map<String, dynamic> json) {
    return AllMonthsDetail(
      quantity: json['quantity'] == null
          ? null
          : Quantity.fromJson(json['quantity'] as Map<String, dynamic>),
      ammount: json['ammount'] as int?,
      rate: json['rate'] as int?,
      month: json['month'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'quantity': quantity?.toJson(),
        'ammount': ammount,
        'rate': rate,
        'month': month,
      };

  @override
  List<Object?> get props => [quantity, ammount, rate, month];
}

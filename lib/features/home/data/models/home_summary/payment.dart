import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String? currency;
  final num? amount;
  final num? count;

  const Payment({this.currency, this.amount, this.count});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        currency: json['currency'] as String?,
        amount: json['amount'] as num?,
        count: json['count'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'amount': amount,
        'count': count,
      };

  @override
  List<Object?> get props => [currency, amount, count];
}

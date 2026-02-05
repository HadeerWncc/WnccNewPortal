import 'package:equatable/equatable.dart';

class Bank extends Equatable {
  final String? name;
  final String? currency;
  final int? transactions;
  final int? totalAmount;

  const Bank({
    this.name,
    this.currency,
    this.transactions,
    this.totalAmount,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        name: json['name'] as String?,
        currency: json['currency'] as String?,
        transactions: json['transactions'] as int?,
        totalAmount: json['totalAmount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'currency': currency,
        'transactions': transactions,
        'totalAmount': totalAmount,
      };

  @override
  List<Object?> get props => [name, currency, transactions, totalAmount];
}

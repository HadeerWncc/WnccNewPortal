import 'package:equatable/equatable.dart';

import 'bank.dart';

class Payment extends Equatable {
  final int? day;
  final int? month;
  final int? mode;
  final String? date;
  final String? displayDate;
  final int? totalAmount;
  final int? transactions;
  final List<Bank>? banks;

  const Payment({
    this.day,
    this.month,
    this.mode,
    this.date,
    this.displayDate,
    this.totalAmount,
    this.transactions,
    this.banks,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        day: json['day'] as int?,
        month: json['month'] as int?,
        mode: json['mode'] as int?,
        date: json['date'] as String?,
        displayDate: json['displayDate'] as String?,
        totalAmount: json['totalAmount'] as int?,
        transactions: json['transactions'] as int?,
        banks: (json['banks'] as List<dynamic>?)
            ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'mode': mode,
        'date': date,
        'displayDate': displayDate,
        'totalAmount': totalAmount,
        'transactions': transactions,
        'banks': banks?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      day,
      month,
      mode,
      date,
      displayDate,
      totalAmount,
      transactions,
      banks,
    ];
  }
}

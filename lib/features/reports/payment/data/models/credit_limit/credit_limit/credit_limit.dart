import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CreditLimit extends Equatable {
  final String? customerCode;
  final String? customerName;
  final num? creditLimit;
  final String? fromDate;
  final String? toDate;
  final String? salesRep;
  final String? salesRepId;

  const CreditLimit({
    this.customerCode,
    this.customerName,
    this.creditLimit,
    this.fromDate,
    this.toDate,
    this.salesRep,
    this.salesRepId,
  });

  factory CreditLimit.fromJson(Map<String, dynamic> json) => CreditLimit(
        customerCode: json['customerCode'] as String?,
        customerName: json['customerName'] as String?,
        creditLimit: json['creditLimit'] as num?,
        fromDate: json['fromDate'] as String?,
        toDate: json['toDate'] as String?,
        salesRep: json['salesRep'] as String?,
        salesRepId: json['salesRepId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'customerCode': customerCode,
        'customerName': customerName,
        'creditLimit': creditLimit,
        'fromDate': fromDate,
        'toDate': toDate,
        'salesRep': salesRep,
        'salesRepId': salesRepId,
      };

  Map<String, dynamic> toMap() => {
        'Code': int.parse(customerCode ?? ""),
        'Customer': customerName,
        'Credit Limit': creditLimit,
        'From Date':
            DateFormat('d/M/yyyy').format(DateTime.parse(fromDate ?? '')),
        'To Date': DateFormat('d/M/yyyy').format(DateTime.parse(toDate ?? '')),
        'Sales': salesRep,
      };
  @override
  List<Object?> get props {
    return [
      customerCode,
      customerName,
      creditLimit,
      fromDate,
      toDate,
      salesRep,
      salesRepId,
    ];
  }
}

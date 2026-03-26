import 'package:equatable/equatable.dart';

class CustomerBalance extends Equatable {
  final String? customer;
  final String? customerName;
  final String? customerRegion;
  final String? customerRegionDesc;
  final num? amountBalance;
  final num? credit;
  final String? creditSegment;
  final String? salesRep;
  final String? salesRepDesc;

  const CustomerBalance({
    this.customer,
    this.customerName,
    this.customerRegion,
    this.customerRegionDesc,
    this.amountBalance,
    this.credit,
    this.creditSegment,
    this.salesRep,
    this.salesRepDesc,
  });

  factory CustomerBalance.fromJson(Map<String, dynamic> json) {
    return CustomerBalance(
      customer: json['customer'] as String?,
      customerName: json['customerName'] as String?,
      customerRegion: json['customerRegion'] as String?,
      customerRegionDesc: json['customerRegionDesc'] as String?,
      amountBalance: json['amountBalance'] as num?,
      credit: json['credit'] as num?,
      creditSegment: json['creditSegment'] as String?,
      salesRep: json['salesRep'] as String?,
      salesRepDesc: json['salesRepDesc'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'customer': customer,
        'customerName': customerName,
        'customerRegion': customerRegion,
        'customerRegionDesc': customerRegionDesc,
        'amountBalance': amountBalance,
        'credit': credit,
        'creditSegment': creditSegment,
        'salesRep': salesRep,
        'salesRepDesc': salesRepDesc,
      };

  Map<String, dynamic> toMap() => {
        'Code':int.parse(customer??""),
        'Customer': customerName,
        'Region': customerRegionDesc,
        'Balance': amountBalance,
        'Credit limit': credit,
        'Credit Segment': creditSegment,
        'Sales': salesRepDesc,

        // 'customerRegionDesc': customerRegionDesc,
        // 'salesRep': salesRep,
      };

  @override
  List<Object?> get props {
    return [
      customer,
      customerName,
      customerRegion,
      customerRegionDesc,
      amountBalance,
      credit,
      creditSegment,
      salesRep,
      salesRepDesc,
    ];
  }
}

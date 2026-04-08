import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';

class CustomerBalance extends Equatable {
  final String? customer;
  final String? customerName;
  final String? customerRegion;
  final String? customerRegionDesc;
  final num? amountBalance;
  final num? credit;
  final num? effectivelim;
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
    this.effectivelim,
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
      effectivelim: json['effectivelim'] as num?,
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
        'effectivelim': effectivelim,
      };

  Map<String, dynamic> toMap() => {
        'Code': int.parse(customer ?? ""),
        'Customer': customerName,
        'Balance': amountBalance,
        'Credit limit': parseToInt(effectivelim.toString()),
        'Credit Segment': creditSegment,
        'Sales': salesRepDesc,
        'Region': customerRegionDesc,
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
      effectivelim,
    ];
  }
}

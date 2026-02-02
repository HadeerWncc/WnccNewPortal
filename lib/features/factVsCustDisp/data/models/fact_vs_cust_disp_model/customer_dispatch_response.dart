import 'package:equatable/equatable.dart';

class CustomerDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? bags;
  final num? bulk;
  final num? total;
  final num? expBags;
  final num? expBulk;
  final num? jumbo;
  final num? expTrading;
  final num? tExport;
  final num? finalTotal;
  final num? clincker;

  const CustomerDispatchResponse(
      {this.masry,
      this.wadie,
      this.bags,
      this.bulk,
      this.total,
      this.expBags,
      this.expBulk,
      this.expTrading,
      this.tExport,
      this.jumbo,
      this.finalTotal,
      this.clincker});

  factory CustomerDispatchResponse.fromJson(Map<String, dynamic> json) {
    return CustomerDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      bags: json['totalBags'] as num?,
      bulk: json['bulk'] as num?,
      total: json['total'] as num?,
      expBags: json['exportBags'] as num?,
      expBulk: json['exportBulk'] as num?,
      jumbo: json['jumbo'] as num?,
      expTrading: json['exportTrading'] as num?,
      tExport: json['totalExport'] as num?,
      clincker: json['clinker'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'bags': bags,
        'bulk': bulk,
        'total': total,
        'exp_Bags': expBags,
        'exp_Bulk': expBulk,
        'jumbo': jumbo,
        'exp_Trading': expTrading,
        't_Export': tExport,
        'clinker': clincker,
      };

  @override
  List<Object?> get props {
    return [
      masry,
      wadie,
      bags,
      bulk,
      total,
      expBags,
      expBulk,
      expTrading,
      tExport,
      jumbo,
      clincker,
      finalTotal
    ];
  }
}

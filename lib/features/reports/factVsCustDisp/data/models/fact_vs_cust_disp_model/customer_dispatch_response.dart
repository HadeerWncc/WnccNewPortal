import 'package:equatable/equatable.dart';

class CustomerDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? localBags;
  final num? localBulk;
  final num? localTotal;
  final num? total;
  final num? exportBags;
  final num? exportBulk;
  final num? exportTrading;

  final num? totalExport;
  final num? extra;
  final num? clinker;
  final num? extraClinker;

  const CustomerDispatchResponse({
    this.masry,
    this.wadie,
    this.localBags,
    this.localBulk,
    this.localTotal,
    this.total,
    this.exportBags,
    this.exportBulk,
    this.exportTrading,
    this.totalExport,
    this.extra,
    this.clinker,
    this.extraClinker,
  });

  factory CustomerDispatchResponse.fromJson(Map<String, dynamic> json) {
    return CustomerDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      localBags: json['localBags'] as num?,
      localBulk: json['localBulk'] as num?,
      localTotal: json['localTotal'] as num?,
      total: json['total'],
      exportBags: json['exportBags'] as num?,
      exportBulk: json['exportBulk'] as num?,
      exportTrading: json['exportTrading'] as num?,
      totalExport: json['totalExport'] as num?,
      clinker: json['clinker'] as num?,
      extra: json['extra'] as num?,
      extraClinker: json['extraClinker'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'bags': localBags,
        'bulk': localBulk,
        'l_total': localTotal,
        'exp_Bags': exportBags,
        'exp_Bulk': exportBulk,
        't_Export': totalExport,
        'total': total,
      };

  @override
  List<Object?> get props {
    return [
      masry,
      wadie,
      localBags,
      localBulk,
      localTotal,
      exportBags,
      exportBulk,
      exportTrading,
      totalExport,
      extraClinker,
      extra,
      clinker,
    ];
  }
}

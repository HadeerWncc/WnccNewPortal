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
  final num? loadExport;
  final num? tExport;
  final num? extra;
  final num? clinker;
  final num? exClinker;

  const CustomerDispatchResponse({
    this.masry,
    this.wadie,
    this.bags,
    this.bulk,
    this.total,
    this.expBags,
    this.expBulk,
    this.expTrading,
    this.loadExport,
    this.tExport,
    this.jumbo,
    this.extra,
    this.clinker,
    this.exClinker,
  });

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
      extra: json['extra'] as num?,
      clinker: json['clinker'] as num?,
      exClinker: json['extraClinker'] as num?,
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
        // 'loadExport': loadExport,
        't_Export': tExport,
        'extra': extra,
        'clinker': clinker,
        'ex_Clinker': exClinker,
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
      loadExport,
      tExport,
      jumbo,
      extra,
      clinker,
      exClinker,
    ];
  }
}

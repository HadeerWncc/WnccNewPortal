import 'package:equatable/equatable.dart';

class CustomerDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? totalBags;
  final num? bulk;
  final num? total;
  final num? exportBags;
  final num? exportBulk;
  final num? exportTrading;
  final num? loadExport;
  final num? totalExport;
  final num? jumbo;
  final num? extra;
  final num? clinker;
  final num? extraClinker;

  const CustomerDispatchResponse({
    this.masry,
    this.wadie,
    this.totalBags,
    this.bulk,
    this.total,
    this.exportBags,
    this.exportBulk,
    this.exportTrading,
    this.loadExport,
    this.totalExport,
    this.jumbo,
    this.extra,
    this.clinker,
    this.extraClinker,
  });

  factory CustomerDispatchResponse.fromJson(Map<String, dynamic> json) {
    return CustomerDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      totalBags: json['totalBags'] as num?,
      bulk: json['bulk'] as num?,
      total: json['total'] as num?,
      exportBags: json['exportBags'] as num?,
      exportBulk: json['exportBulk'] as num?,
      exportTrading: json['exportTrading'] as num?,
      loadExport: json['loadExport'] as num?,
      totalExport: json['totalExport'] as num?,
      jumbo: json['jumbo'] as num?,
      extra: json['extra'] as num?,
      clinker: json['clinker'] as num?,
      extraClinker: json['extraClinker'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'totalBags': totalBags,
        'bulk': bulk,
        'total': total,
        'exportBags': exportBags,
        'exportBulk': exportBulk,
        'exportTrading': exportTrading,
        'loadExport': loadExport,
        'totalExport': totalExport,
        'jumbo': jumbo,
        'extra': extra,
        'clinker': clinker,
        'extraClinker': extraClinker,
      };

  @override
  List<Object?> get props {
    return [
      masry,
      wadie,
      totalBags,
      bulk,
      total,
      exportBags,
      exportBulk,
      exportTrading,
      loadExport,
      totalExport,
      jumbo,
      extra,
      clinker,
      extraClinker,
    ];
  }
}

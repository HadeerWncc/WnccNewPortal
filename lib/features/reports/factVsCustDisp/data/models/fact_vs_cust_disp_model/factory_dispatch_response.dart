import 'package:equatable/equatable.dart';

class FactoryDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? localBags;
  final num? localBulk;
  final num? exportBags;
  final num? exportBulk;
  final num? totalExport;
  final num? localTotal;
  final num? total;

  const FactoryDispatchResponse({
    this.masry,
    this.wadie,
    this.localBags,
    this.localBulk,
    this.localTotal,
    this.total,
    this.exportBags,
    this.exportBulk,
    this.totalExport,
  });

  factory FactoryDispatchResponse.fromJson(Map<String, dynamic> json) {
    return FactoryDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      localBags: json['localBags'] as num?,
      localBulk: json['localBulk'] as num?,
      localTotal: json['localTotal'] as num,
      total: json['total'] as num?,
      exportBags: json['exportBags'],
      exportBulk: json['exportBulk'],
      totalExport: json['totalExport'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'bags': localBags,
        'bulk': localBulk,
        'l_total': localTotal,
        'exp_bags': exportBags,
        'exp_bulk': exportBulk,
        't_export': totalExport,
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
      total,
      exportBags,
      exportBulk,
      totalExport,
    ];
  }
}

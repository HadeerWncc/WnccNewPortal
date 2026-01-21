import 'package:equatable/equatable.dart';

class FactoryDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? bags;
  final num? bulk;
  final num? roma;
  final num? tBulk;
  final num? export;
  final num? total;

  const FactoryDispatchResponse({
    this.masry,
    this.wadie,
    this.bags,
    this.bulk,
    this.roma,
    this.tBulk,
    this.export,
    this.total,
  });

  factory FactoryDispatchResponse.fromJson(Map<String, dynamic> json) {
    return FactoryDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      bags: json['localBags'] as num?,
      bulk: json['bulk'] as num?,
      roma: json['roma'] as num?,
      tBulk: json['localBulk'] as num?,
      export: json['exports'] as num?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'bags': bags,
        'bulk': bulk,
        'roma': roma,
        't.Bulk': tBulk,
        'export': export,
        'total': total,
      };

  @override
  List<Object?> get props {
    return [
      masry,
      wadie,
      bags,
      bulk,
      roma,
      tBulk,
      export,
      total,
    ];
  }
}

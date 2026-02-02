import 'package:equatable/equatable.dart';

class FactoryDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? localBags;
  final num? bulk;
  final num? roma;
  final num? localBulk;
  final num? exports;
  final num? total;
  const FactoryDispatchResponse({
    this.masry,
    this.wadie,
    this.localBags,
    this.bulk,
    this.roma,
    this.localBulk,
    this.exports,
    this.total,
  });

  factory FactoryDispatchResponse.fromJson(Map<String, dynamic> json) {
    return FactoryDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      localBags: json['localBags'] as num?,
      bulk: json['bulk'] as num?,
      roma: json['roma'] as num?,
      localBulk: json['localBulk'] as num?,
      exports: json['exports'] as num?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'localBags': localBags,
        'bulk': bulk,
        'roma': roma,
        'localBulk': localBulk,
        'exports': exports,
        'total': total,
      };

  @override
  List<Object?> get props {
    return [
      masry,
      wadie,
      localBags,
      bulk,
      roma,
      localBulk,
      exports,
      total,
    ];
  }
}

import 'package:equatable/equatable.dart';

class FactoryDispatchResponse extends Equatable {
  final num? masry;
  final num? wadie;
  final num? bags;
  final num? bulk;
  final num? export;
  final num? total;

  const FactoryDispatchResponse({
    this.masry,
    this.wadie,
    this.bags,
    this.bulk,
    this.export,
    this.total,
  });

  factory FactoryDispatchResponse.fromJson(Map<String, dynamic> json) {
    return FactoryDispatchResponse(
      masry: json['masry'] as num?,
      wadie: json['wadie'] as num?,
      bags: json['localBags'] as num?,
      bulk: json['bulk'] as num?,
      export: json['exports'] as num?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'masry': masry,
        'wadie': wadie,
        'bags': bags,
        'bulk': bulk,
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
      export,
      total,
    ];
  }
}

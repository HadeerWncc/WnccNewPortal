import 'package:equatable/equatable.dart';

class TypeQuantity extends Equatable {
  final num? bags;
  final num? bulk;
  final num? total;

  const TypeQuantity({this.bags, this.bulk, this.total});

  factory TypeQuantity.fromJson(Map<String, dynamic> json) {
    return TypeQuantity(
      bags: json['bags'] as num?,
      bulk: json['bulk'] as num?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bags': bags,
        'bulk': bulk,
        'total': total,
      };

  @override
  List<Object?> get props => [bags, bulk, total];
}

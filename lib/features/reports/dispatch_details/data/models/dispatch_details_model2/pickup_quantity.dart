import 'package:equatable/equatable.dart';

class PickupQuantity extends Equatable {
  final num? bags;
  final num? bulk;
  final num? total;

  const PickupQuantity({this.bags, this.bulk, this.total});

  factory PickupQuantity.fromJson(Map<String, dynamic> json) {
    return PickupQuantity(
      bags: json['bags'] as num?,
      bulk: (json['bulk'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
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

import 'package:equatable/equatable.dart';

class DeliveryQuantity extends Equatable {
  final num? bags;
  final num? bulk;
  final num? total;

  const DeliveryQuantity({this.bags, this.bulk, this.total});

  factory DeliveryQuantity.fromJson(Map<String, dynamic> json) {
    return DeliveryQuantity(
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

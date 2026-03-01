import 'package:equatable/equatable.dart';

class DispatchQuantity extends Equatable {
  final num? deliveryQuantity;
  final num? pickupQuantity;
  final num? total;

  const DispatchQuantity({this.deliveryQuantity, this.pickupQuantity, this.total});

  factory DispatchQuantity.fromJson(Map<String, dynamic> json) => DispatchQuantity(
        deliveryQuantity: json['deliveryQuantity'] as num?,
        pickupQuantity: json['pickupQuantity'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'deliveryQuantity': deliveryQuantity,
        'pickupQuantity': pickupQuantity,
        'total': total,
      };

  @override
  List<Object?> get props => [deliveryQuantity, pickupQuantity, total];
}

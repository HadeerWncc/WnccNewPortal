import 'package:equatable/equatable.dart';

import 'delivery_quantity.dart';
import 'pickup_quantity.dart';

class Total extends Equatable {
  final DeliveryQuantity? deliveryQuantity;
  final PickupQuantity? pickupQuantity;
  final double? total;

  const Total({this.deliveryQuantity, this.pickupQuantity, this.total});

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        deliveryQuantity: json['deliveryQuantity'] == null
            ? null
            : DeliveryQuantity.fromJson(
                json['deliveryQuantity'] as Map<String, dynamic>),
        pickupQuantity: json['pickupQuantity'] == null
            ? null
            : PickupQuantity.fromJson(
                json['pickupQuantity'] as Map<String, dynamic>),
        total: (json['total'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'deliveryQuantity': deliveryQuantity?.toJson(),
        'pickupQuantity': pickupQuantity?.toJson(),
        'total': total,
      };

  @override
  List<Object?> get props => [deliveryQuantity, pickupQuantity, total];
}

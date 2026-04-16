import 'package:equatable/equatable.dart';

import 'delivery_quantity.dart';
import 'pickup_quantity.dart';

class DispatchDetailsQuantity extends Equatable {
  final DeliveryQuantity? deliveryQuantity;
  final PickupQuantity? pickupQuantity;
  final num? total;

  const DispatchDetailsQuantity(
      {this.deliveryQuantity, this.pickupQuantity, this.total});

  factory DispatchDetailsQuantity.fromJson(Map<String, dynamic> json) =>
      DispatchDetailsQuantity(
        deliveryQuantity: json['deliveryQuantity'] == null
            ? null
            : DeliveryQuantity.fromJson(
                json['deliveryQuantity'] as Map<String, dynamic>),
        pickupQuantity: json['pickupQuantity'] == null
            ? null
            : PickupQuantity.fromJson(
                json['pickupQuantity'] as Map<String, dynamic>),
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'deliveryQuantity': deliveryQuantity?.toJson(),
        'pickupQuantity': pickupQuantity?.toJson(),
        'total': total,
      };

  @override
  List<Object?> get props => [deliveryQuantity, pickupQuantity, total];
}

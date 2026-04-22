import 'package:equatable/equatable.dart';

import 'type_quantity.dart';

class DispatchQuantity extends Equatable {
  final TypeQuantity? deliveryQuantity;
  final TypeQuantity? pickupQuantity;
  final num? total;

  const DispatchQuantity(
      {this.deliveryQuantity, this.pickupQuantity, this.total});

  factory DispatchQuantity.fromJson(Map<String, dynamic> json) =>
      DispatchQuantity(
        deliveryQuantity: json['deliveryQuantity'] == null
            ? null
            : TypeQuantity.fromJson(
                json['deliveryQuantity'] as Map<String, dynamic>),
        pickupQuantity: json['pickupQuantity'] == null
            ? null
            : TypeQuantity.fromJson(
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

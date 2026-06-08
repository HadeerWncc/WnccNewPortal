import 'package:equatable/equatable.dart';
import 'dispatch_details_quantity.dart';

class Value extends Equatable {
  final DispatchDetailsQuantity? deliveryQuantity;
  final DispatchDetailsQuantity? pickupQuantity;
  final num? total;

  const Value({this.deliveryQuantity, this.pickupQuantity, this.total});

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        deliveryQuantity: json['deliveryQuantity'] == null
            ? null
            : DispatchDetailsQuantity.fromJson(
                json['deliveryQuantity'] as Map<String, dynamic>),
        pickupQuantity: json['pickupQuantity'] == null
            ? null
            : DispatchDetailsQuantity.fromJson(
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

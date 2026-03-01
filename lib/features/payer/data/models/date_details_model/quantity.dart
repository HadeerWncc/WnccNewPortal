import 'package:equatable/equatable.dart';

import 'delivery.dart';
import 'pickup.dart';

class Quantity extends Equatable {
  final Delivery? delivery;
  final Pickup? pickup;
  final num? total;
  final num? totalCount;

  const Quantity({this.delivery, this.pickup, this.total, this.totalCount});

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        delivery: json['delivery'] == null
            ? null
            : Delivery.fromJson(json['delivery'] as Map<String, dynamic>),
        pickup: json['pickup'] == null
            ? null
            : Pickup.fromJson(json['pickup'] as Map<String, dynamic>),
        total: json['total'] as int?,
        totalCount: json['totalCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'delivery': delivery?.toJson(),
        'pickup': pickup?.toJson(),
        'total': total,
        'totalCount': totalCount,
      };

  @override
  List<Object?> get props => [delivery, pickup, total, totalCount];
}

import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';

class Quota extends Equatable {
  final DispatchDetailsQuantity? delivery;
  final DispatchDetailsQuantity? pickup;

  const Quota({this.delivery, this.pickup});

  factory Quota.fromJson(Map<String, dynamic> json) => Quota(
        delivery: json['delivery'] == null
            ? null
            : DispatchDetailsQuantity.fromJson(
                json['delivery'] as Map<String, dynamic>),
        pickup: json['pickup'] == null
            ? null
            : DispatchDetailsQuantity.fromJson(
                json['pickup'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'delivery': delivery?.toJson(),
        'pickup': pickup?.toJson(),
      };

  @override
  List<Object?> get props => [delivery, pickup];
}

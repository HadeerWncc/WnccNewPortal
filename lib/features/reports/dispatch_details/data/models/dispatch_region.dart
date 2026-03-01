import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_quantity.dart';


class DispatchRegion extends Equatable {
  final String? regionId;
  final String? regionName;
  final String? areaName;
  final bool? enableDispatchReporting;
  final DispatchQuantity? quantity;

  const DispatchRegion({
    this.regionId,
    this.regionName,
    this.areaName,
    this.enableDispatchReporting,
    this.quantity,
  });

  factory DispatchRegion.fromJson(Map<String, dynamic> json) => DispatchRegion(
        regionId: json['regionId'] as String?,
        regionName: json['regionName'] as String?,
        areaName: json['areaName'] as String?,
        enableDispatchReporting: json['enableDispatchReporting'] as bool?,
        quantity: json['quantity'] == null
            ? null
            : DispatchQuantity.fromJson(json['quantity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'regionId': regionId,
        'regionName': regionName,
        'areaName': areaName,
        'enableDispatchReporting': enableDispatchReporting,
        'quantity': quantity?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      regionId,
      regionName,
      areaName,
      enableDispatchReporting,
      quantity,
    ];
  }
}

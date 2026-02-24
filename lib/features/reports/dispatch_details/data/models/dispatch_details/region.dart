import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final String? regionId;
  final String? regionName;
  final String? areaName;
  final bool? enableDispatchReporting;
  final num? quantity;

  const Region({
    this.regionId,
    this.regionName,
    this.areaName,
    this.enableDispatchReporting,
    this.quantity,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        regionId: json['regionId'] as String?,
        regionName: json['regionName'] as String?,
        areaName: json['areaName'] as String?,
        enableDispatchReporting: json['enableDispatchReporting'] as bool?,
        quantity: json['quantity'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'regionId': regionId,
        'regionName': regionName,
        'areaName': areaName,
        'enableDispatchReporting': enableDispatchReporting,
        'quantity': quantity,
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

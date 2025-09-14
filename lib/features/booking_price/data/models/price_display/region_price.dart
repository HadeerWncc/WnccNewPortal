import 'package:equatable/equatable.dart';

class RegionPrice extends Equatable {
  final String? id;
  final int? deliveryPrice;
  final int? pickupPrice;
  final bool? enablePricing;
  final String? regionId;
  final String? region;
  final String? area;

  const RegionPrice({
    this.id,
    this.deliveryPrice,
    this.pickupPrice,
    this.enablePricing,
    this.regionId,
    this.region,
    this.area,
  });

  factory RegionPrice.fromJson(Map<String, dynamic> json) => RegionPrice(
        id: json['id'] as String?,
        deliveryPrice: json['deliveryPrice'] as int?,
        pickupPrice: json['pickupPrice'] as int?,
        enablePricing: json['enablePricing'] as bool?,
        regionId: json['regionId'] as String?,
        region: json['region'] as String?,
        area: json['area'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'deliveryPrice': deliveryPrice,
        'pickupPrice': pickupPrice,
        'enablePricing': enablePricing,
        'regionId': regionId,
        'region': region,
        'area': area,
      };

  @override
  List<Object?> get props {
    return [
      id,
      deliveryPrice,
      pickupPrice,
      enablePricing,
      regionId,
      region,
      area,
    ];
  }
}

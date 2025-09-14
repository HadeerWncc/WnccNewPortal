import 'package:equatable/equatable.dart';

import 'payer_price.dart';
import 'region_price.dart';

class PriceDisplay extends Equatable {
  final String? id;
  final int? productType;
  final int? deliveryPrice;
  final int? pickupPrice;
  final int? deliveryTargetPrice;
  final int? pickupTargetPrice;
  final bool? isChanged;
  final String? fromDate;
  final dynamic toDate;
  final DateTime? createdAt;
  final dynamic lastUpdatedAt;
  final dynamic createdBy;
  final dynamic lastUpdatedBy;
  final bool? isDeleted;
  final List<RegionPrice>? regionPrices;
  final List<PayerPrice>? payerPrices;

  const PriceDisplay({
    this.id,
    this.productType,
    this.deliveryPrice,
    this.pickupPrice,
    this.deliveryTargetPrice,
    this.pickupTargetPrice,
    this.isChanged,
    this.fromDate,
    this.toDate,
    this.createdAt,
    this.lastUpdatedAt,
    this.createdBy,
    this.lastUpdatedBy,
    this.isDeleted,
    this.regionPrices,
    this.payerPrices,
  });

  factory PriceDisplay.fromJson(Map<String, dynamic> json) => PriceDisplay(
        id: json['id'] as String?,
        productType: json['productType'] as int?,
        deliveryPrice: json['deliveryPrice'] as int?,
        pickupPrice: json['pickupPrice'] as int?,
        deliveryTargetPrice: json['deliveryTargetPrice'] as int?,
        pickupTargetPrice: json['pickupTargetPrice'] as int?,
        isChanged: json['isChanged'] as bool?,
        fromDate: json['fromDate'] as String?,
        toDate: json['toDate'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] as dynamic,
        createdBy: json['createdBy'] as dynamic,
        lastUpdatedBy: json['lastUpdatedBy'] as dynamic,
        isDeleted: json['isDeleted'] as bool?,
        regionPrices: (json['regionPrices'] as List<dynamic>?)
            ?.map((e) => RegionPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        payerPrices: (json['payerPrices'] as List<dynamic>?)
            ?.map((e) => PayerPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'productType': productType,
        'deliveryPrice': deliveryPrice,
        'pickupPrice': pickupPrice,
        'deliveryTargetPrice': deliveryTargetPrice,
        'pickupTargetPrice': pickupTargetPrice,
        'isChanged': isChanged,
        'fromDate': fromDate,
        'toDate': toDate,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt,
        'createdBy': createdBy,
        'lastUpdatedBy': lastUpdatedBy,
        'isDeleted': isDeleted,
        'regionPrices': regionPrices?.map((e) => e.toJson()).toList(),
        'payerPrices': payerPrices?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      productType,
      deliveryPrice,
      pickupPrice,
      deliveryTargetPrice,
      pickupTargetPrice,
      isChanged,
      fromDate,
      toDate,
      createdAt,
      lastUpdatedAt,
      createdBy,
      lastUpdatedBy,
      isDeleted,
      regionPrices,
      payerPrices,
    ];
  }
}

import 'package:equatable/equatable.dart';

class PayerPrice extends Equatable {
  final String? id;
  final int? deliveryPrice;
  final int? pickupPrice;
  final bool? enablePricing;
  final String? payerId;
  final String? payer;

  const PayerPrice({
    this.id,
    this.deliveryPrice,
    this.pickupPrice,
    this.enablePricing,
    this.payerId,
    this.payer,
  });

  factory PayerPrice.fromJson(Map<String, dynamic> json) => PayerPrice(
        id: json['id'] as String?,
        deliveryPrice: json['deliveryPrice'] as int?,
        pickupPrice: json['pickupPrice'] as int?,
        enablePricing: json['enablePricing'] as bool?,
        payerId: json['payerId'] as String?,
        payer: json['payer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'deliveryPrice': deliveryPrice,
        'pickupPrice': pickupPrice,
        'enablePricing': enablePricing,
        'payerId': payerId,
        'payer': payer,
      };

  @override
  List<Object?> get props {
    return [
      id,
      deliveryPrice,
      pickupPrice,
      enablePricing,
      payerId,
      payer,
    ];
  }
}

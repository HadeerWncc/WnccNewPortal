import 'package:equatable/equatable.dart';

import 'pickupility_product.dart';

class PickupModel extends Equatable {
  final String? date;
  final String? customerId;
  final String? customerName;
  final String? salesId;
  final String? salesName;
  final List<PickupilityProduct>? pickupilityProducts;

  const PickupModel({
    this.date,
    this.customerId,
    this.customerName,
    this.salesId,
    this.salesName,
    this.pickupilityProducts,
  });

  factory PickupModel.fromJson(Map<String, dynamic> json) => PickupModel(
        date: json['date'] as String?,
        customerId: json['customerId'] as String?,
        customerName: json['customerName'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        pickupilityProducts: (json['pickupilityProducts'] as List<dynamic>?)
            ?.map((e) => PickupilityProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'customerId': customerId,
        'customerName': customerName,
        'salesId': salesId,
        'salesName': salesName,
        'pickupilityProducts':
            pickupilityProducts?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      date,
      customerId,
      customerName,
      salesId,
      salesName,
      pickupilityProducts,
    ];
  }
}

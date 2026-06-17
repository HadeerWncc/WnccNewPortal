import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/totals_pickup.dart';

import 'pickupility_product.dart';

class PickupModel extends Equatable {
  final String? date;
  final String? customerId;
  final String? customerName;
  final String? salesId;
  final String? salesName;
  final TotalsPickup? totalQuantity;
  final TotalsPickup? totalPriorited;
  final TotalsPickup? totalDispatched;
  final TotalsPickup? totalRemaining;
  final String? status;
  final List<PickupilityProduct>? pickupilityProducts;

  const PickupModel({
    this.date,
    this.customerId,
    this.customerName,
    this.salesId,
    this.salesName,
    this.totalQuantity,
    this.totalPriorited,
    this.totalDispatched,
    this.totalRemaining,
    this.status,
    this.pickupilityProducts,
  });

  factory PickupModel.fromJson(Map<String, dynamic> json) => PickupModel(
        date: json['date'] as String?,
        customerId: json['customerId'] as String?,
        customerName: json['customerName'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        totalQuantity: json['totalQuantity'] == null
            ? null
            : TotalsPickup.fromJson(
                json['totalQuantity'] as Map<String, dynamic>),
        totalPriorited: json['totalPriorited'] == null
            ? null
            : TotalsPickup.fromJson(
                json['totalPriorited'] as Map<String, dynamic>),
        totalDispatched: json['totalDispatched'] == null
            ? null
            : TotalsPickup.fromJson(
                json['totalDispatched'] as Map<String, dynamic>),
        totalRemaining: json['totalRemaining'] == null
            ? null
            : TotalsPickup.fromJson(
                json['totalRemaining'] as Map<String, dynamic>),
        status: json['status'] as String?,
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
        'totalQuantity': totalQuantity,
        'totalPriorited': totalPriorited,
        'totalDispatched': totalDispatched,
        'totalRemaining': totalRemaining,
        'status': status,
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
      totalQuantity,
      totalPriorited,
      totalDispatched,
      totalRemaining,
      status,
      pickupilityProducts,
    ];
  }
}

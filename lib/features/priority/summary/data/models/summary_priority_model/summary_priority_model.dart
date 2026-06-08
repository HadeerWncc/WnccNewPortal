import 'package:equatable/equatable.dart';

class SummaryPriorityModel extends Equatable {
  final String? salesId;
  final String? salesName;
  final num? deliveryBulkQuota;
  final num? pickupBulkQuota;
  final num? totalBulkQuota;
  final num? deliveryBagsQuota;
  final num? pickupBagsQuota;
  final num? totalBagsQuota;
  final num? pickupBulkPriority;
  final num? deliveryBulkPriority;
  final num? pickupBagsPriority;
  final num? deliveryBagsPriority;
  final num? totalBagsPriority;
  final num? totalBulkPriority;
  final num? pickupBulkDispatch;
  final num? deliveryBulkDispatch;
  final num? pickupBagsDispatch;
  final num? deliveryBagsDispatch;
  final num? totalBagsDispatch;
  final num? totalBulkDispatch;
  final num? extraDeliveryBulkQuota;
  final num? extraPickupBulkQuota;
  final num? extraDeliveryBagsQuota;
  final num? extraPickupBagsQuota;

  const SummaryPriorityModel({
    this.salesId,
    this.salesName,
    this.deliveryBulkQuota,
    this.pickupBulkQuota,
    this.totalBulkQuota,
    this.deliveryBagsQuota,
    this.pickupBagsQuota,
    this.totalBagsQuota,
    this.pickupBulkPriority,
    this.deliveryBulkPriority,
    this.pickupBagsPriority,
    this.deliveryBagsPriority,
    this.totalBagsPriority,
    this.totalBulkPriority,
    this.pickupBulkDispatch,
    this.deliveryBulkDispatch,
    this.pickupBagsDispatch,
    this.deliveryBagsDispatch,
    this.totalBagsDispatch,
    this.totalBulkDispatch,
    this.extraDeliveryBulkQuota,
    this.extraPickupBulkQuota,
    this.extraDeliveryBagsQuota,
    this.extraPickupBagsQuota,
  });

  factory SummaryPriorityModel.fromJson(Map<String, dynamic> json) {
    return SummaryPriorityModel(
      salesId: json['salesId'] as String?,
      salesName: json['salesName'] as String?,
      deliveryBulkQuota: json['deliveryBulkQuota'] as num?,
      pickupBulkQuota: json['pickupBulkQuota'] as num?,
      totalBulkQuota: json['totalBulkQuota'] as num?,
      deliveryBagsQuota: json['deliveryBagsQuota'] as num?,
      pickupBagsQuota: json['pickupBagsQuota'] as num?,
      totalBagsQuota: json['totalBagsQuota'] as num?,
      pickupBulkPriority: json['pickupBulkPriority'] as num?,
      deliveryBulkPriority: json['deliveryBulkPriority'] as num?,
      pickupBagsPriority: json['pickupBagsPriority'] as num?,
      deliveryBagsPriority: json['deliveryBagsPriority'] as num?,
      totalBagsPriority: json['totalBagsPriority'] as num?,
      totalBulkPriority: json['totalBulkPriority'] as num?,
      pickupBulkDispatch: json['pickupBulkDispatch'] as num?,
      deliveryBulkDispatch: json['deliveryBulkDispatch'] as num?,
      pickupBagsDispatch: json['pickupBagsDispatch'] as num?,
      deliveryBagsDispatch: json['deliveryBagsDispatch'] as num?,
      totalBagsDispatch: json['totalBagsDispatch'] as num?,
      totalBulkDispatch: json['totalBulkDispatch'] as num?,
      extraDeliveryBulkQuota: json['extraDeliveryBulkQuota'] as num?,
      extraPickupBulkQuota: json['extraPickupBulkQuota'] as num?,
      extraDeliveryBagsQuota: json['extraDeliveryBagsQuota'] as num?,
      extraPickupBagsQuota: json['extraPickupBagsQuota'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'salesId': salesId,
        'salesName': salesName,
        'deliveryBulkQuota': deliveryBulkQuota,
        'pickupBulkQuota': pickupBulkQuota,
        'totalBulkQuota': totalBulkQuota,
        'deliveryBagsQuota': deliveryBagsQuota,
        'pickupBagsQuota': pickupBagsQuota,
        'totalBagsQuota': totalBagsQuota,
        'pickupBulkPriority': pickupBulkPriority,
        'deliveryBulkPriority': deliveryBulkPriority,
        'pickupBagsPriority': pickupBagsPriority,
        'deliveryBagsPriority': deliveryBagsPriority,
        'totalBagsPriority': totalBagsPriority,
        'totalBulkPriority': totalBulkPriority,
        'pickupBulkDispatch': pickupBulkDispatch,
        'deliveryBulkDispatch': deliveryBulkDispatch,
        'pickupBagsDispatch': pickupBagsDispatch,
        'deliveryBagsDispatch': deliveryBagsDispatch,
        'totalBagsDispatch': totalBagsDispatch,
        'totalBulkDispatch': totalBulkDispatch,
        'extraDeliveryBulkQuota': extraDeliveryBulkQuota,
        'extraPickupBulkQuota': extraPickupBulkQuota,
        'extraDeliveryBagsQuota': extraDeliveryBagsQuota,
        'extraPickupBagsQuota': extraPickupBagsQuota,
      };

  @override
  List<Object?> get props {
    return [
      salesId,
      salesName,
      deliveryBulkQuota,
      pickupBulkQuota,
      totalBulkQuota,
      deliveryBagsQuota,
      pickupBagsQuota,
      totalBagsQuota,
      pickupBulkPriority,
      deliveryBulkPriority,
      pickupBagsPriority,
      deliveryBagsPriority,
      totalBagsPriority,
      totalBulkPriority,
      pickupBulkDispatch,
      deliveryBulkDispatch,
      pickupBagsDispatch,
      deliveryBagsDispatch,
      totalBagsDispatch,
      totalBulkDispatch,
      extraDeliveryBulkQuota,
      extraPickupBulkQuota,
      extraDeliveryBagsQuota,
      extraPickupBagsQuota,
    ];
  }
}

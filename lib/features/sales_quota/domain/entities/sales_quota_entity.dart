class SalesQuotaEntity {
  final String salesId;
  final int totalQuota;
  final int deliveryBulkQuota;
  final int pickupBulkQuota;
  final int totalBulkQuota;
  final int deliveryBagsQuota;
  final int pickupBagsQuota;
  final int totalBagsQuota;
  final int extraDeliveryBulkQuota;
  final int extraPickupBulkQuota;
  final int settelementBulkQuota;
  final int extraDeliveryBagsQuota;
  final int extraPickupBagsQuota;
  final int settelementBagsQuota;

  SalesQuotaEntity({
    required this.salesId,
    required this.totalQuota,
    required this.deliveryBulkQuota,
    required this.pickupBulkQuota,
    required this.totalBulkQuota,
    required this.deliveryBagsQuota,
    required this.pickupBagsQuota,
    required this.totalBagsQuota,
    required this.extraDeliveryBulkQuota,
    required this.extraPickupBulkQuota,
    required this.settelementBulkQuota,
    required this.extraPickupBagsQuota,
    required this.extraDeliveryBagsQuota,
    required this.settelementBagsQuota,
  });

  Map<String, dynamic> toJson() {
    return {
      'salesId': salesId,
      'totalQuota': totalQuota,
      'deliveryBulkQuota': deliveryBulkQuota,
      'pickupBulkQuota': pickupBulkQuota,
      'totalBulkQuota': totalBulkQuota,
      'deliveryBagsQuota': deliveryBagsQuota,
      'pickupBagsQuota': pickupBagsQuota,
      'totalBagsQuota': totalBagsQuota,
      'extraDeliveryBulkQuota': extraDeliveryBulkQuota,
      'extraPickupBulkQuota': extraPickupBulkQuota,
      'settelementBulkQuota': settelementBulkQuota,
      'extraDeliveryBagsQuota': extraDeliveryBagsQuota,
      'extraPickupBagsQuota': extraPickupBagsQuota,
      'settelementBagsQuota': settelementBagsQuota,
    };
  }
}

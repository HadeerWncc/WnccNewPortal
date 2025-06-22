class SalesQuotaEntity {
  final String salesId;
  final int totalQuota;
  final int deliveryBulkQuota;
  final int pickupBulkQuota;
  final int totalBulkQuota;
  final int deliveryBagsQuota;
  final int pickupBagsQuota;
  final int totalBagsQuota;
  final int extraBulkQuota;
  final int settelementBulkQuota;
  final int extraBagsQuota;
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
    required this.extraBulkQuota,
    required this.settelementBulkQuota,
    required this.extraBagsQuota,
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
      'extraBulkQuota': extraBulkQuota,
      'settelementBulkQuota': settelementBulkQuota,
      'extraBagsQuota': extraBagsQuota,
      'settelementBagsQuota': settelementBagsQuota,
    };
  }
}

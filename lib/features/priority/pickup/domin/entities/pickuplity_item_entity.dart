class PickuplityItemEntity {
  final num? priorityQuantity;
  final num? dispatchQuantity;
  final String customerId;
  final String materialId;
  final String? salesId;

  PickuplityItemEntity({
    required this.priorityQuantity,
    required this.dispatchQuantity,
    required this.customerId,
    required this.materialId,
    required this.salesId,
  });
}

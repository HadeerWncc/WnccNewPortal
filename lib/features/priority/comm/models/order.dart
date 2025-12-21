class Order {
  final String fromDate;
  final String toDate;
  final int status;
  final String dispatchChannel;
  final String category;
  final String payerId;
  final String salesId;
  final String keyword;
  final bool isDeactivated;

  Order(
      {required this.fromDate,
      required this.toDate,
      required this.status,
      required this.dispatchChannel,
      required this.category,
      required this.payerId,
      required this.salesId,
      required this.keyword,
      required this.isDeactivated});
}

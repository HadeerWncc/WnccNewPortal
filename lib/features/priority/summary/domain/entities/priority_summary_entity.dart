import 'package:wncc_portal/core/utils/methods/format_num.dart';

class PrioritySummaryEntity {
  final String salesName;
  final num pickupQuota;
  final num deliveryQuota;
  final num totalQuota;
  final num pickupPriority;
  final num deliveryPriority;
  final num totalPriority;
  final num pickupDispatch;
  final num deliveryDispatch;
  final num totalDispatch;

  PrioritySummaryEntity({
    required this.salesName,
    required this.pickupQuota,
    required this.deliveryQuota,
    required this.totalQuota,
    required this.pickupPriority,
    required this.deliveryPriority,
    required this.totalPriority,
    required this.pickupDispatch,
    required this.deliveryDispatch,
    required this.totalDispatch,
  });

  Map<String, dynamic> quotaMaping() => {
        'SalesName': salesName,
        'Delivery': formatNum(deliveryQuota),
        'Pickup': formatNum(pickupQuota),
        'Total': formatNum(totalQuota),
      };

  Map<String, dynamic> priorityMaping() => {
        'SalesName': salesName,
        'Delivery': formatNum(deliveryPriority),
        'Pickup': formatNum(pickupPriority),
        'Total': formatNum(totalPriority),
      };

  Map<String, dynamic> dispatchMaping() => {
        'SalesName': salesName,
        'Delivery': formatNum(deliveryDispatch),
        'Pickup': formatNum(pickupDispatch),
        'Total': formatNum(totalDispatch),
      };
}

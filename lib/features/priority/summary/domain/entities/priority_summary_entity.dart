import 'package:wncc_portal/core/utils/methods/format_num.dart';

class PrioritySummaryEntity {
  final String salesName;
  final num pickupQuota;
  final num deliveryQuota;
  final num totalQuota;
  final num pickupPriority;
  final num deliveryPriority;
  final num totalPriority;

  PrioritySummaryEntity({required this.salesName, required this.pickupQuota, required this.deliveryQuota, required this.totalQuota, required this.pickupPriority, required this.deliveryPriority, required this.totalPriority});
  
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
}
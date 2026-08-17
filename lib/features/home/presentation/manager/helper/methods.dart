import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';

Map<String, String> getGreeting() {
  final hour = DateTime.now().hour - 1;

  if (hour < 12) {
    return {"Good Morning": "☀️"};
  } else if (hour < 17) {
    return {"Good Afternoon": "🌤"};
  } else {
    return {"Good Evening": "🌙"};
  }
}

DispatchDetailsQuantity getQuotaValue(Quota quota, List<String> incoterm) {
  if (incoterm.isEmpty || incoterm.length == 2) {
    return DispatchDetailsQuantity(
        bags: ((quota.pickup!.bags ?? 0) + (quota.delivery!.bags ?? 0)),
        bulk: ((quota.pickup!.bulk ?? 0) + (quota.delivery!.bulk ?? 0)),
        total: ((quota.pickup!.total ?? 0) + (quota.delivery!.total ?? 0)));
  } else {
    if (incoterm[0] == "Delivery") {
      return quota.delivery!;
    } else {
      return quota.pickup!;
    }
  }
}

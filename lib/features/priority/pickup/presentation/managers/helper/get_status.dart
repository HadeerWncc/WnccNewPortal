import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickupility_product.dart';

String getStatus(List<PickupilityProduct> products) {
  bool hasInProcess = false;
  bool hasPending = false;
  bool hasCompleted = false;

  for (var p in products) {
    final priorited = p.prioritedQnty ?? 0;
    final dispatched = p.dispatchedQnty ?? 0;

    if (priorited != 0 && dispatched != 0 && priorited > dispatched) {
      hasInProcess = true;
    } else if (priorited != 0 && dispatched == 0) {
      hasPending = true;
    } else if (priorited != 0 && priorited == dispatched) {
      hasCompleted = true;
    }
  }

  if (hasInProcess || (hasPending && hasCompleted)) {
    return "in-process";
  } else if (hasPending) {
    return "pending";
  } else if (hasCompleted) {
    return "completed";
  } else {
    return "no-quantity";
  }
}

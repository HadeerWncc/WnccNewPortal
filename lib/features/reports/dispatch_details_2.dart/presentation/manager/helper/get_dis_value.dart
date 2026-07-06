import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';

String getDisValue(Value value, List<String> incoterm, List<String> type) {
  if ((incoterm.isEmpty || incoterm.length > 1) &&
      (type.isEmpty || type.length > 1)) {
    return formatNum((value.total ?? 0).round());
  } else if ((incoterm.isEmpty || incoterm.length > 1)) {
    // not empty and length = 1
    if (type[0] == "Bags") {
      return formatNum(((value.pickupQuantity!.bags ?? 0) +
              (value.deliveryQuantity!.bags ?? 0))
          .round());
    } else {
      return formatNum(((value.pickupQuantity!.bulk ?? 0) +
              (value.deliveryQuantity!.bulk ?? 0))
          .round());
    }
  } else if ((type.isEmpty || type.length > 1)) {
    if (incoterm[0] == "Delivery") {
      return formatNum((value.deliveryQuantity!.total ?? 0).round());
    } else {
      return formatNum((value.pickupQuantity!.total ?? 0).round());
    }
  } else {
    if (incoterm[0] == "Delivery") {
      if (type[0] == "Bags") {
        return formatNum((value.deliveryQuantity!.bags ?? 0).round());
      } else {
        return formatNum((value.deliveryQuantity!.bulk ?? 0).round());
      }
    } else {
      if (type[0] == "Bags") {
        return formatNum((value.pickupQuantity!.bags ?? 0).round());
      } else {
        return formatNum((value.pickupQuantity!.bulk ?? 0).round());
      }
    }
  }
}

num getDisSortValue(
  Value value,
  List<String> incoterm,
  List<String> type,
) {
  if ((incoterm.isEmpty || incoterm.length > 1) &&
      (type.isEmpty || type.length > 1)) {
    return value.total ?? 0;
  } else if ((incoterm.isEmpty || incoterm.length > 1)) {
    if (type[0] == "Bags") {
      return (value.pickupQuantity?.bags ?? 0) +
          (value.deliveryQuantity?.bags ?? 0);
    } else {
      return (value.pickupQuantity?.bulk ?? 0) +
          (value.deliveryQuantity?.bulk ?? 0);
    }
  } else if ((type.isEmpty || type.length > 1)) {
    if (incoterm[0] == "Delivery") {
      return value.deliveryQuantity?.total ?? 0;
    } else {
      return value.pickupQuantity?.total ?? 0;
    }
  } else {
    if (incoterm[0] == "Delivery") {
      return type[0] == "Bags"
          ? (value.deliveryQuantity?.bags ?? 0)
          : (value.deliveryQuantity?.bulk ?? 0);
    } else {
      return type[0] == "Bags"
          ? (value.pickupQuantity?.bags ?? 0)
          : (value.pickupQuantity?.bulk ?? 0);
    }
  }
}

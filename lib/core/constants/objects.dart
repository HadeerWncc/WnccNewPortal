import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';

Value defaultQuantity = const Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: 0,
      bulk: 0,
      total: 0,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: 0,
      bulk: 0,
      total: 0,
    ),
    total: 0,
  );
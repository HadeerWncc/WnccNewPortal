import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/dispatch.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/total.dispatch.model.dart';

Value getCustomerTotal(
  List<Export> data,
  String customerName,
  List<String> brand,
) {
  double deliveryBags = 0;
  double deliveryBulk = 0;
  double pickupBags = 0;
  double pickupBulk = 0;
  double total = 0;

  for (final day in data) {
    final dispatch = day.dispatches?.cast<Dispatch?>().firstWhere(
          (d) => d?.name == customerName,
          orElse: () => null,
        );

    if (dispatch == null) continue;

    List<Total>? totalDisBrand = dispatch.total;
    if (brand.isNotEmpty) {
      totalDisBrand =
          dispatch.total?.where((t) => brand.contains(t.name)).toList();
    }
    for (final item in totalDisBrand ?? []) {
      deliveryBags += item.total?.deliveryQuantity?.bags ?? 0;
      deliveryBulk += item.total?.deliveryQuantity?.bulk ?? 0;

      pickupBags += item.total?.pickupQuantity?.bags ?? 0;
      pickupBulk += item.total?.pickupQuantity?.bulk ?? 0;

      total += item.total?.total ?? 0;
    }
  }

  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: deliveryBags,
      bulk: deliveryBulk,
      total: deliveryBags + deliveryBulk,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: pickupBags,
      bulk: pickupBulk,
      total: pickupBags + pickupBulk,
    ),
    total: total,
  );
}

Value getGrandTotal(
  List<Export> data,
  List<String> customers,
  List<String> brands,
) {
  double deliveryBags = 0;
  double deliveryBulk = 0;
  double pickupBags = 0;
  double pickupBulk = 0;
  double total = 0;

  for (final customer in customers) {
    final value = getCustomerTotal(data, customer, brands);

    deliveryBags += value.deliveryQuantity?.bags ?? 0;
    deliveryBulk += value.deliveryQuantity?.bulk ?? 0;

    pickupBags += value.pickupQuantity?.bags ?? 0;
    pickupBulk += value.pickupQuantity?.bulk ?? 0;

    total += value.total ?? 0;
  }

  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: deliveryBags,
      bulk: deliveryBulk,
      total: deliveryBags + deliveryBulk,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: pickupBags,
      bulk: pickupBulk,
      total: pickupBags + pickupBulk,
    ),
    total: total,
  );
}

Value getDayTotal(Export exportDispatch, List<String> brands) {
  double deliveryBags = 0;
  double deliveryBulk = 0;
  double pickupBags = 0;
  double pickupBulk = 0;
  double total = 0;

  List<Total>? totalDisBrand = exportDispatch.total;
  if (brands.isNotEmpty) {
    totalDisBrand =
        exportDispatch.total?.where((t) => brands.contains(t.name)).toList();
  }
  for (final item in totalDisBrand ?? []) {
    deliveryBags += item.total?.deliveryQuantity?.bags ?? 0;
    deliveryBulk += item.total?.deliveryQuantity?.bulk ?? 0;

    pickupBags += item.total?.pickupQuantity?.bags ?? 0;
    pickupBulk += item.total?.pickupQuantity?.bulk ?? 0;

    total += item.total?.total ?? 0;
  }

  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: deliveryBags,
      bulk: deliveryBulk,
      total: deliveryBags + deliveryBulk,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: pickupBags,
      bulk: pickupBulk,
      total: pickupBags + pickupBulk,
    ),
    total: total,
  );
}

Value getCustomerValue(
  Export data,
  String customerName,
  List<String> brand,
) {
  double deliveryBags = 0;
  double deliveryBulk = 0;
  double pickupBags = 0;
  double pickupBulk = 0;
  double total = 0;

  final dispatch = data.dispatches?.cast<Dispatch?>().firstWhere(
        (d) => d?.name == customerName,
        orElse: () => null,
      );
  //  if (dispatch == null) continue;
  List<Total>? totalDisBrand = dispatch?.total;
  if (brand.isNotEmpty) {
    totalDisBrand =
        dispatch?.total?.where((t) => brand.contains(t.name)).toList();
  }

  for (final item in totalDisBrand ?? []) {
    deliveryBags += item.total?.deliveryQuantity?.bags ?? 0;
    deliveryBulk += item.total?.deliveryQuantity?.bulk ?? 0;

    pickupBags += item.total?.pickupQuantity?.bags ?? 0;
    pickupBulk += item.total?.pickupQuantity?.bulk ?? 0;

    total += item.total?.total ?? 0;
  }

  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: deliveryBags,
      bulk: deliveryBulk,
      total: deliveryBags + deliveryBulk,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: pickupBags,
      bulk: pickupBulk,
      total: pickupBags + pickupBulk,
    ),
    total: total,
  );
}

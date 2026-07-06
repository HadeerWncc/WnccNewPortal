import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatches_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/disptch_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/month.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/total.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/values_date.dart';

DispatchDetailsVsModel getTotalDis(
  List<DispatchDetailsVsModel> dispatchDetailsList,
) {
  return DispatchDetailsVsModel(
    id: "Total",
    name: "Total Dispatch",
    salesName: "Total Dispatch",
    salesId: "",
    total: mergeTotals(
      dispatchDetailsList.map((e) => e.total!).toList(),
    ),
    totalToday: mergeTotals(
      dispatchDetailsList.map((e) => e.totalToday!).toList(),
    ),
    totalCheckedIn: mergeValues(
      dispatchDetailsList.map((e) => e.totalCheckedIn!).toList(),
    ),
    totalLoading: mergeValues(
      dispatchDetailsList.map((e) => e.totalLoading!).toList(),
    ),
    months: mergeMonths(
      dispatchDetailsList.expand((e) => e.months!).toList(),
    ),
    values: mergeDayValues(
      dispatchDetailsList.expand((e) => e.values!).toList(),
    ),
    dispatches: mergeDispatchesRegion(
      dispatchDetailsList.expand((e) => e.dispatches!).toList(),
    ),
  );
}

Total mergeTotals(List<Total> totals) {
  return Total(
    value: mergeValues(
      totals.map((e) => e.value!).toList(),
    ),
    dispatches: mergeDispatches(
      totals.expand((e) => e.dispatches!).toList(),
    ),
  );
}

Value mergeValues(List<Value> values) {
  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.deliveryQuantity?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.deliveryQuantity?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.deliveryQuantity?.total ?? 0),
      ),
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickupQuantity?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickupQuantity?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickupQuantity?.total ?? 0),
      ),
    ),
    total: values.fold(
      0,
      (s, e) => (s ?? 0) + (e.total ?? 0),
    ),
  );
}

List<Dispatch> mergeDispatches(List<Dispatch> dispatches) {
  final grouped = <String, List<Dispatch>>{};

  for (final dispatch in dispatches) {
    grouped.putIfAbsent(dispatch.id!, () => []);
    grouped[dispatch.id]!.add(dispatch);
  }

  return grouped.values.map((group) {
    return Dispatch(
      id: group.first.id,
      name: group.first.name,
      value: mergeValues(
        group.map((e) => e.value!).toList(),
      ),
      dispatches: [],
    );
  }).toList();
}

List<Month> mergeMonths(List<Month> months) {
  final grouped = <String, List<Month>>{};

  for (final month in months) {
    grouped.putIfAbsent(month.name!, () => []);
    grouped[month.name]!.add(month);
  }

  return grouped.values.map((group) {
    return Month(
      name: group.first.name,
      date: group.first.date,
      value: mergeTotals(
        group.map((e) => e.value!).toList(),
      ),
    );
  }).toList();
}

List<ValuesDate> mergeDayValues(List<ValuesDate> values) {
  final grouped = <int, List<ValuesDate>>{};

  for (final value in values) {
    grouped.putIfAbsent(value.date!, () => []);
    grouped[value.date]!.add(value);
  }

  return grouped.values.map((group) {
    return ValuesDate(
      date: group.first.date,
      dispatches: mergeDispatchesValue(
        group.expand((e) => e.dispatches!).toList(),
      ),
    );
  }).toList();
}

List<DispatchValue> mergeDispatchesValue(List<DispatchValue> dispatches) {
  final grouped = <String, List<DispatchValue>>{};

  for (final dispatch in dispatches) {
    grouped.putIfAbsent(dispatch.name!, () => []);
    grouped[dispatch.name]!.add(dispatch);
  }

  return grouped.values.map((group) {
    return DispatchValue(
      name: group.first.name,
      value: mergeTotals(
        group.map((e) => e.value!).toList(),
      ),
    );
  }).toList();
}

List<DispatchesRegion> mergeDispatchesRegion(
    List<DispatchesRegion> dispatches) {
  final grouped = <String, List<DispatchesRegion>>{};

  for (final dispatch in dispatches) {
    grouped.putIfAbsent(dispatch.name ?? "", () => []);
    grouped[dispatch.name ?? ""]!.add(dispatch);
  }

  return grouped.values.map((group) {
    return DispatchesRegion(
      id: group.first.id,
      name: group.first.name,
      dispatches: mergeDispatchesValue(
        group.expand((e) => e.dispatches!).toList(),
      ),
    );
  }).toList();
}

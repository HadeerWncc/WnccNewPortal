import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/relation_value.dart';

Value mergeValue(Value? a, Value? b) {
  if (a == null) return b!;
  if (b == null) return a;

  return Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: (a.deliveryQuantity?.bags ?? 0) + (b.deliveryQuantity?.bags ?? 0),
      bulk: (a.deliveryQuantity?.bulk ?? 0) + (b.deliveryQuantity?.bulk ?? 0),
      total:
          (a.deliveryQuantity?.total ?? 0) + (b.deliveryQuantity?.total ?? 0),
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: (a.pickupQuantity?.bags ?? 0) + (b.pickupQuantity?.bags ?? 0),
      bulk: (a.pickupQuantity?.bulk ?? 0) + (b.pickupQuantity?.bulk ?? 0),
      total: (a.pickupQuantity?.total ?? 0) + (b.pickupQuantity?.total ?? 0),
    ),
    total: (a.total ?? 0) + (b.total ?? 0),
  );
}

List<DataValue> getTotalAreas(List<DispatchDetailsPerRegionModel> data) {
  final Map<String, DataValue> areas = {};

  for (final month in data) {
    for (final day in month.monthDays ?? []) {
      for (final area in day.dataValues ?? []) {
        if (area.name == null) continue;

        if (!areas.containsKey(area.name)) {
          areas[area.name!] = DataValue(
            id: area.id,
            name: area.name,
            quantity: area.quantity,
            relationValues: [],
          );
        } else {
          final old = areas[area.name!]!;

          areas[area.name!] = DataValue(
            id: old.id,
            name: old.name,
            quantity: mergeValue(old.quantity, area.quantity),
            relationValues: old.relationValues,
          );
        }

        //---------------- Regions ----------------//

        final currentArea = areas[area.name!]!;

        final Map<String, RelationValue> regions = {
          for (final r in currentArea.relationValues ?? []) r.id!: r,
        };

        for (final region in area.relationValues ?? []) {
          if (region.id == null) continue;

          if (!regions.containsKey(region.id)) {
            regions[region.id!] = region;
          } else {
            final old = regions[region.id!]!;

            regions[region.id!] = RelationValue(
              id: old.id,
              name: old.name,
              quantity: mergeValue(old.quantity, region.quantity),
              relationValues: old.relationValues,
            );
          }
        }

        areas[area.name!] = DataValue(
          id: currentArea.id,
          name: currentArea.name,
          quantity: currentArea.quantity,
          relationValues: regions.values.toList(),
        );
      }
    }
  }

  return areas.values.toList();
}

List<DataValue> getAreas(DispatchDetailsPerRegionModel month,
    List<DispatchDetailsPerRegionModel> alldata) {
  final Map<String, DataValue> areas = {};
  final totalAreas = getTotalAreas(alldata);
  for (final day in month.monthDays ?? []) {
    for (final area in day.dataValues ?? []) {
      if (area.name == null) continue;

      if (!areas.containsKey(area.name)) {
        areas[area.name!] = DataValue(
          id: area.id,
          name: area.name,
          quantity: area.quantity,
          relationValues: [],
        );
      } else {
        final old = areas[area.name!]!;

        areas[area.name!] = DataValue(
          id: old.id,
          name: old.name,
          quantity: mergeValue(old.quantity, area.quantity),
          relationValues: old.relationValues,
        );
      }

      //---------------- Regions ----------------//

      final currentArea = areas[area.name!]!;

      final Map<String, RelationValue> regions = {
        for (final r in currentArea.relationValues ?? []) r.id!: r,
      };

      for (final region in area.relationValues ?? []) {
        if (region.id == null) continue;

        if (!regions.containsKey(region.id)) {
          regions[region.id!] = region;
        } else {
          final old = regions[region.id!]!;

          regions[region.id!] = RelationValue(
            id: old.id,
            name: old.name,
            quantity: mergeValue(old.quantity, region.quantity),
            relationValues: old.relationValues,
          );
        }
      }

      areas[area.name!] = DataValue(
        id: currentArea.id,
        name: currentArea.name,
        quantity: currentArea.quantity,
        relationValues: regions.values.toList(),
      );
    }
  }
  for (final area in totalAreas) {
    areas.putIfAbsent(
      area.name!,
      () => DataValue(
        id: area.id,
        name: area.name,
        quantity: const Value(
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
        ),
        relationValues: [],
      ),
    );
  }

  for (final totalArea in totalAreas) {
    final currentArea = areas[totalArea.name]!;

    final Map<String, RelationValue> regions = {
      for (final r in currentArea.relationValues ?? []) r.id!: r,
    };

    for (final region in totalArea.relationValues ?? []) {
      regions.putIfAbsent(
        region.id!,
        () => RelationValue(
          id: region.id,
          name: region.name,
          quantity: const Value(
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
          ),
          relationValues: [],
        ),
      );
    }

    areas[totalArea.name!] = DataValue(
      id: currentArea.id,
      name: currentArea.name,
      quantity: currentArea.quantity,
      relationValues: regions.values.toList(),
    );
  }

  return totalAreas.map((a) => areas[a.name]!).toList();
}

Value getMonthTotal(DispatchDetailsPerRegionModel month) {
  Value? total;

  for (final day in month.monthDays ?? []) {
    total = mergeValue(total, day.total);
  }

  return total!;
}

Value getGrandTotal(List<DispatchDetailsPerRegionModel> data) {
  Value? total;

  for (final month in data) {
    total = mergeValue(total, getMonthTotal(month));
  }

  return total!;
}

List<String> getAllRegions(List<DispatchDetailsPerRegionModel> data) {
  List<DataValue> areas = getTotalAreas(data);
  List<String> regions = areas
      .expand((a) => a.relationValues ?? <RelationValue>[])
      .map((r) => r.name!)
      .toSet()
      .toList();
  return regions;
}


Map<String, RelationValue> buildRegionMap(
    List<RelationValue>? regions) {
  return {
    for (final region in regions ?? <RelationValue>[])
      if (region.name != null) region.name!: region,
  };
}

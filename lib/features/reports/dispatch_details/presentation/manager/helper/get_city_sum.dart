import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

num getCitySum({
  required List<MonthDay> monthDays,
  required String cityId,
  required QuantityType quantityType,
  required QuantityMatrial quantityMatrial,
}) {
  return monthDays.fold(0, (prev, day) {
    num daySum = 0;

    for (var region in day.dataValues ?? []) {
      final city = region.relationValues?.where((c) => c.id == cityId).toList();

      if (city != null && city.isNotEmpty) {
        daySum += getQuantityValue(
          city.first.quantity,
          quantityType,
          quantityMatrial,
        );
      }
    }

    return prev + daySum;
  });
}

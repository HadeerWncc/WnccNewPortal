import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';

num getCitySum({
  required List<MonthDay> monthDays,
  required String cityId,
  required List<String> quantityType,
  required List<String> quantityMatrial,
}) {
  return monthDays.fold(0, (prev, day) {
    num daySum = 0;

    for (var region in day.dataValues ?? []) {
      final city = region.relationValues?.where((c) => c.id == cityId).toList();

      if (city != null && city.isNotEmpty) {
        daySum += getDisSortValue(
          city.first.quantity,
          quantityType,
          quantityMatrial,
        );
      }
    }

    return prev + daySum;
  });
}

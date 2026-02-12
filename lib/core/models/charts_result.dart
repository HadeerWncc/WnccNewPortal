import 'package:wncc_portal/core/models/chart_data.dart';

class ChartsResult {
  final List<CustomChartData> banks;
  final List<CustomChartData> days;

  ChartsResult({
    required this.banks,
    required this.days,
  });
}

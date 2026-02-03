import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';

class CompareingEntity {
  final List<ComparingEntityItem> compareYear;
  final List<ComparingEntityItem> selectedYear;
  final List<ComparingEntityItem> difference;

  CompareingEntity(
      {required this.compareYear,
      required this.selectedYear,
      required this.difference});
}

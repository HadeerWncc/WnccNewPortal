class FactoryEntity {
  final String? date;
  final double? bags;
  final double? bulk;
  final double? export;
  final double? total;

  FactoryEntity(
      {required this.date,
      required this.bags,
      required this.bulk,
      required this.export,
      required this.total});

  @override
  String toString() {
    return 'FactoryEntity(date: $date, bags: $bags, bulk: $bulk, export: $export, total: $total)';
  }
}

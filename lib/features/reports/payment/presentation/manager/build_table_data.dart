import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';

class TableData {
  final List<String?> headers;
  final List<List<dynamic>> rows;

  TableData(this.headers, this.rows);
}

TableData buildTableData(List<Payment> days, String curr) {
  final banks = days
      .expand((d) => d.banks!)
      .where((p) => p.currency == curr && p.name != null)
      .map((b) => b.name)
      .toSet()
      .toList();

  /// headers
  final headers = [...banks, "TOTAL"];

  List<List<dynamic>> rows = [];

  /// لتجميع totals لكل بنك
  final bankTotals = {for (var b in banks) b: 0.0};

  /// ===== صفوف الأيام =====
  for (var day in days) {
final bankMap = {
  for (var b in day.banks!.where((p) => p.currency == curr && p.name != null))
    b.name: b.totalAmount
};

    double dayTotal = 0;

    final rowValues = banks.map((bank) {
      final value = bankMap[bank] ?? 0.0;
      dayTotal += value;

      bankTotals[bank] = bankTotals[bank]! + value;

      return value;
    }).toList();

    rows.add([
      ...rowValues,
      dayTotal, // ✅ total اليوم
    ]);
  }

  /// ===== صف TOTAL الأخير =====
  final grandTotal = bankTotals.values.fold(0.0, (sum, v) => sum + v);

  rows.add([
    ...banks.map((b) => bankTotals[b]),
    grandTotal,
  ]);

  return TableData(headers, rows);
}

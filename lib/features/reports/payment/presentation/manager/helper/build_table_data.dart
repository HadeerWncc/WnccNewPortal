import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/chart_data.dart';
import 'package:wncc_portal/core/models/charts_result.dart';
import 'package:wncc_portal/core/models/stached_chart_data.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/bank.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/helper/top_two.dart';

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
  final headers = ["Date", ...banks, "TOTAL"];

  List<List<dynamic>> rows = [];

  /// لتجميع totals لكل بنك
  final bankTotals = {for (var b in banks) b: 0.0};

  /// ===== صفوف الأيام =====
  for (var day in days) {
    final bankMap = {
      for (var b
          in day.banks!.where((p) => p.currency == curr && p.name != null))
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
      (day.mode == 1)
          ? DateFormat("MMM").format(DateTime.parse(day.date!))
          : day.day,
      ...rowValues,
      dayTotal, // ✅ total اليوم
    ]);
  }

  /// ===== صف TOTAL الأخير =====
  final grandTotal = bankTotals.values.fold(0.0, (sum, v) => sum + v);

  rows.add([
    "TOTAL",
    ...banks.map((b) => bankTotals[b]),
    grandTotal,
  ]);

  return TableData(headers, rows);
}

ChartsResult buildChartsData(List<Payment> days, String currency) {
  final Map<String, double> bankTotals = {};
  final List<CustomChartData> dailyTotals = [];

  for (final day in days) {
    double dayTotal = 0;
    List<Bank>? banks = day.banks?.where((b) => b.name != null).toList();

    for (final bank in banks ?? []) {
      if (bank.currency != currency) continue;

      // ✅ جمع البنوك
      bankTotals.update(
        bank.name!,
        (value) => value + bank.totalAmount,
        ifAbsent: () => bank.totalAmount,
      );

      // ✅ جمع اليوم
      dayTotal += bank.totalAmount;
    }

    dailyTotals.add(
      CustomChartData(day.displayDate!, dayTotal),
    );
  }

  final bankChart =
      bankTotals.entries.map((e) => CustomChartData(e.key, e.value)).toList();

  return ChartsResult(
    banks: bankChart,
    days: dailyTotals,
  );
}

Map<String, List<StackedChartData>> buildStackedData(
  List<Payment> days,
  String currency,
) {
  final Map<String, List<StackedChartData>> result = {};

  for (final day in days) {
    final Map<String, double> dailyBanks = {};
    List<Bank>? banks = day.banks?.where((b) => b.name != null).toList();

    // جمع بنوك اليوم
    for (final bank in banks ?? []) {
      if (bank.currency != currency) continue;

      dailyBanks[bank.name!] = bank.totalAmount;
    }

    // لكل بنك ضيف قيمة (حتى لو صفر)
    final allBanks = {
      ...result.keys,
      ...dailyBanks.keys,
    };

    for (final bankName in allBanks) {
      result.putIfAbsent(bankName, () => []);

      result[bankName]!.add(
        StackedChartData(
          (day.mode == 1)
              ? DateFormat("MMM").format(DateTime(2026, day.month!))
              : DateFormat("MMM d,yyyy").format(DateTime.parse(day.date!)),
          dailyBanks[bankName] ?? 0, // مهم جداً
        ),
      );
    }
  }
  return result;
}

TopTwo getTop(List<Payment> days, String currency) {
  final maxMonthByAmount = days
      .reduce((a, b) => (a.totalAmount ?? 0) > (b.totalAmount ?? 0) ? a : b);

  Bank topDate = Bank(
    name: maxMonthByAmount.displayDate,
    totalAmount: maxMonthByAmount.totalAmount,
    transactions: maxMonthByAmount.transactions,
  );

  final Map<String, BankTotal> totals = {};
  for (var day in days) {
    for (Bank bank in day.banks ?? []) {
      if (bank.name == null || bank.currency != currency) continue;

      final name = bank.name!;

      totals.putIfAbsent(name, () => BankTotal());

      totals[name]!.amount += bank.totalAmount ?? 0;
      totals[name]!.transactions += bank.transactions ?? 0;
    }
  }

  Bank topBank = const Bank();
  if (totals.isEmpty) {
    topBank = const Bank(name: 'N/A', totalAmount: 0, transactions: 0);
  } else {
    final maxBank = totals.entries.reduce(
      (a, b) => a.value.amount > b.value.amount ? a : b,
    );

    topBank = Bank(
        name: maxBank.key,
        totalAmount: maxBank.value.amount,
        transactions: maxBank.value.transactions);
  }

  return TopTwo(topFirst: topDate, topSecound: topBank);
}

Map<String, num> getCurrencyTotals(List<Payment> days) {
  final totals = <String, num>{};

  for (var day in days) {
    for (var bank in day.banks ?? []) {
      final currency = bank.currency ?? "Unknown";

      totals[currency] = (totals[currency] ?? 0) + (bank.totalAmount ?? 0);
    }
  }

  return totals;
}

class BankTotal {
  num amount = 0;
  int transactions = 0;
}

class CurrencyChartData {
  final String currency;
  final num amount;

  CurrencyChartData(this.currency, this.amount);
}

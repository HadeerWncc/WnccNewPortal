import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/chart_data.dart';
import 'package:wncc_portal/core/models/stached_chart_data.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/bank.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/helper/top_two.dart';

class TableData {
  final List<String?> headers;
  final List<List<dynamic>> rows;

  TableData(this.headers, this.rows);
}

List<CustomChartData> buildColumnChartData(
    List<PaymentDetailsModel> days, String currency) {
  final Map<String, double> bankTotals = {};

  for (var item in days) {
    if (item.currency == currency && item.houseBank != null) {
      String bankName = item.houseBank!;
      double amount = (item.amount ?? 0).toDouble();

      bankTotals[bankName] = (bankTotals[bankName] ?? 0) + amount;
    }
  }

  return bankTotals.entries
      .map((e) => CustomChartData(e.key, e.value))
      .toList();
}

Map<String, List<StackedChartData>> buildDetailsStackedData(
  List<PaymentDetailsModel> items,
  String currency,
) {
  Map<String, Map<String, double>> groupedByDateAndBank = {};
  Set<String> allBankNames = {};

  for (var item in items) {
    if (item.currency != currency) continue;

    String dateKey =
        DateFormat("MMM d, yyyy").format(DateTime.parse(item.postingDate!));
    String bankName = item.houseBank ?? "Unknown";
    double amount = (item.amount ?? 0).toDouble();

    allBankNames.add(bankName);

    groupedByDateAndBank.putIfAbsent(dateKey, () => {});
    groupedByDateAndBank[dateKey]![bankName] =
        (groupedByDateAndBank[dateKey]![bankName] ?? 0) + amount;
  }
  Map<String, List<StackedChartData>> result = {};

  for (String bankName in allBankNames) {
    result[bankName] = [];

    groupedByDateAndBank.forEach((date, banksMap) {
      result[bankName]!.add(
        StackedChartData(
          date,
          banksMap[bankName] ?? 0.0,
        ),
      );
    });
  }

  return result;
}

TopTwo getDetailsTop(List<PaymentDetailsModel> items, String currency) {
  // مابات بتشيل Object من نوع Bank علشان نجمع فيه الـ amount والـ transactions مع بعض
  final Map<String, BankTotal> customerData = {};
  final Map<String, BankTotal> salesData = {};
  items = items.where((i) => i.currency == currency).toList();
  if (items.isEmpty) {
    return TopTwo(topFirst: const Bank(), topSecound: const Bank());
  }

  for (var item in items) {
    if (item.currency != currency) continue;

    double amount = (item.amount ?? 0).toDouble();
    String customerName = item.customerName ?? "Unknown Customer";
    String salesRep = item.salesRepName ?? "Unknown Rep";

    salesData.putIfAbsent(salesRep, () => BankTotal());
    salesData[salesRep]!.amount += amount;
    salesData[salesRep]!.transactions += 1; // زيادة عدد العمليات

    customerData.putIfAbsent(customerName, () => BankTotal());
    customerData[customerName]!.amount += amount;
    customerData[customerName]!.transactions += 1; // زيادة عدد العمليات
  }

  final topSalesEntry = salesData.entries.reduce(
    (a, b) => a.value.amount > b.value.amount ? a : b,
  );
  Bank topSales = Bank(
    name: topSalesEntry.key,
    totalAmount: topSalesEntry.value.amount,
    transactions: topSalesEntry.value.transactions,
  );
  final topCustEntry = customerData.entries.reduce(
    (a, b) => a.value.amount > b.value.amount ? a : b,
  );
  Bank topCust = Bank(
    name: topCustEntry.key,
    totalAmount: topCustEntry.value.amount,
    transactions: topCustEntry.value.transactions,
  );
  return TopTwo(
    topFirst: topSales,
    topSecound: topCust,
  );
}

Map<String, num> getDetailsCurrencyTotals(List<PaymentDetailsModel> days) {
  var totals = <String, num>{};

  num totalEgp = days
      .where((d) => d.currency == "EGP")
      .map((d) => d.amount ?? 0)
      .fold(0.0, (previous, current) => previous + current);
  double totalUsd = days
      .where((d) => d.currency == "USD")
      .map((d) => d.amount ?? 0)
      .fold(0.0, (previous, current) => previous + current);

  totals = {
    "EGP": totalEgp,
    "USD": totalUsd,
  };
  return totals;
}

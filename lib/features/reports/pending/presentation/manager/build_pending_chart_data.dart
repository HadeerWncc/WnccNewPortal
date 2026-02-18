import 'package:wncc_portal/core/models/chart_data.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/bank.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/helper/top_two.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';

List<CustomChartData> buildRegionColumnChartData(List<PendingModel> pending) {
  final Map<String, double> regionTotals = {};

  for (var item in pending) {
    if (item.branchName != null) {
      String regionName = item.branchName!;
      double quantity = (item.deliveryQuantity ?? 0).toDouble();

      regionTotals[regionName] = (regionTotals[regionName] ?? 0) + quantity;
    }
  }

  return regionTotals.entries
      .map((e) => CustomChartData(e.key, e.value))
      .toList();
}

List<CustomChartData> buildMatrialColumnChartData(List<PendingModel> pendings) {
  final Map<String, double> matrialTotals = {};

  for (var item in pendings) {
    if (item.materialName != null) {
      String matrialName = item.materialName!;
      double quantity = (item.deliveryQuantity ?? 0).toDouble();
      if (matrialName == 'أسمنت المصري 42.5 معبأ') {
        matrialName = 'المصري معبأ';
      } else if (matrialName == 'أسمنت وادي النيل 42.5 معبأ') {
        matrialName = 'وادي معبأ';
      } else {
        matrialName = 'سائب';
      }
      matrialTotals[matrialName] = (matrialTotals[matrialName] ?? 0) + quantity;
    }
  }

  return matrialTotals.entries
      .map((e) => CustomChartData(e.key, e.value))
      .toList();
}

TopTwo getPendingTop(List<PendingModel> items) {
  // مابات بتشيل Object من نوع Bank علشان نجمع فيه الـ amount والـ transactions مع بعض
  final Map<String, BankTotal> customerData = {};
  final Map<String, BankTotal> salesData = {};
  if (items.isEmpty) {
    return TopTwo(topFirst: const Bank(), topSecound: const Bank());
  }

  for (var item in items) {
    double quantity = (item.deliveryQuantity ?? 0).toDouble();
    String customerName = item.customerName ?? "Unknown Customer";
    String salesRep = item.salesName ?? "Unknown Rep";

    salesData.putIfAbsent(salesRep, () => BankTotal());
    salesData[salesRep]!.amount += quantity;
    salesData[salesRep]!.transactions += 1; // زيادة عدد العمليات

    customerData.putIfAbsent(customerName, () => BankTotal());
    customerData[customerName]!.amount += quantity;
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

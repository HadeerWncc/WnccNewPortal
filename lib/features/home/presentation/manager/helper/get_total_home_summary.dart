import 'package:wncc_portal/features/home/data/models/home_summary/month_dispatch.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/payment.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/sales_datum.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';

Quota mergeQuotas(List<Quota> values) {
  return Quota(
    delivery: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.total ?? 0),
      ),
    ),
    pickup: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.total ?? 0),
      ),
    ),
  );
}

num mergeNums(List<num> values) {
  return values.fold(
    0,
    (s, e) => (s) + (e),
  );
}

List<MonthDispatch> getTotalMonthDispatches(List<SalesDatum> sales) {
  final Map<String, MonthDispatch> result = {};

  for (final sale in sales) {
    for (final month in sale.monthDispatches ?? []) {
      if (result.containsKey(month.month)) {
        final current = result[month.month]!;

        result[month.month] = MonthDispatch(
          month: month.month,
          delivery: (current.delivery??0) + month.delivery,
          pickup: (current.pickup??0) + month.pickup,
        );
      } else {
        result[month.month] = MonthDispatch(
          month: month.month,
          delivery: month.delivery,
          pickup: month.pickup,
        );
      }
    }
  }

  return result.values.toList();
}



List<Payment> getPaymentTotal(List<SalesDatum> sales) {
  final Map<String, Payment> result = {};

  for (final sale in sales) {
    for (final pay in sale.payments ?? []) {
      if (result.containsKey(pay.currency)) {
        final current = result[pay.currency]!;

        result[pay.currency] = Payment(
          currency: pay.currency,
          amount: (current.amount??0) + pay.amount,
          count: (current.count??0) + pay.count,
        );
      } else {
        result[pay.currency] = Payment(
          currency: pay.currency,
          amount: pay.amount,
          count: pay.count,
        );
      }
    }
  }

  return result.values.toList();
}

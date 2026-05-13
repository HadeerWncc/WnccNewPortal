import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/payer/domain/repos/payer_repo.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';
import 'package:wncc_portal/features/reports/payment/domain/entities/customer_deposit.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

part 'payment_per_customer_state.dart';

class PaymentPerCustomerCubit extends Cubit<PaymentPerCustomerState> {
  PaymentPerCustomerCubit(this.paymentsRepo, this.payerRepo)
      : super(PaymentPerCustomerInitial());

  final PaymentsRepo paymentsRepo;
  final PayerRepo payerRepo;

  // Future<void> getPaymentPerCustomer(DateTime fromDate, DateTime toDate) async {
  //   emit(PaymentPerCustomerLoading());
  //   final deposits =
  //       await paymentsRepo.fetchPaymentDetailsData(fromDate, toDate);
  //   deposits
  //       .fold((failure) => emit(PaymentPerCustomerFailure(error: failure.msg)),
  //           (paymentDetails) async {
  //     List<CustomerDeposit> customerDeposite =
  //         buildCustomerTable(paymentDetails);
  //     emit(PaymentPerCustomerSuccess(customerDeposit: customerDeposite));
  //   });
  // }

  /// 🔹 Master Data
  List<PaymentDetailsModel> _allData = [];

  /// 🔹 Filters state
  String _sales = "All";

  /// ✅ Public getter للوصول للـ allData من UI
  List<PaymentDetailsModel> get allData => _allData;

  // =========================================================
  // 🚀 API
  // =========================================================

  Future getPaymentPerCustomer(DateTime fromDate, DateTime toDate) async {
    emit(PaymentPerCustomerLoading());
    final deposits =
        await paymentsRepo.fetchPaymentDetailsData(fromDate, toDate);

    deposits.fold(
      (error) => emit(PaymentPerCustomerFailure(error: error.msg)),
      (data) {
        _allData = data;
        _applyFilters(); // فلترة مباشرة بعد التحميل
      },
    );
  }

  // =========================================================
  // 🚀 Summary calculation
  // =========================================================

  // LoadingDetailsSummaryEntity _calculateSummary(
  //     List<LoadingDetailsModel> loadingDetails) {
  //   num wadi = 0;
  //   num masry = 0;
  //   num bulk = 0;
  //   num others = 0;

  //   for (var l in loadingDetails) {
  //     if (l.materialId == 'F-BU01') {
  //       bulk += l.deliveryQuantity ?? 0;
  //     } else if (l.materialId == 'F-BA01') {
  //       masry += l.deliveryQuantity ?? 0;
  //     } else if (l.materialId == 'F-BA02') {
  //       wadi += l.deliveryQuantity ?? 0;
  //     } else {
  //       others += l.deliveryQuantity ?? 0;
  //     }
  //   }

  //   final total = wadi + masry + bulk + others;

  //   return LoadingDetailsSummaryEntity(
  //     bulk: bulk,
  //     masry: masry,
  //     others: others,
  //     total: total,
  //     wadie: wadi,
  //   );
  // }

  // =========================================================
  // 🚀 Filtering Core
  // =========================================================

  void _applyFilters() {
    emit(PaymentPerCustomerLoading());

    final filtered = _allData.where((t) {
      final matchSales = _sales == "All" || t.salesRepName == _sales;

      return matchSales;
    }).toList();

    final customerDeposite = buildCustomerTable(filtered);
    List<String> salesName =
        _allData.map((s) => s.salesRepName ?? "").toSet().toList();
    emit(
      PaymentPerCustomerSuccess(
        customerDeposit: customerDeposite,
        sales: salesName,
      ),
    );
  }

  // =========================================================
  // 🚀 UI Actions
  // =========================================================

  void changeSales(String value) {
    _sales = value;
    _applyFilters();
  }

  /// اختياري لإعادة كل الفلاتر للوضع الإفتراضي
  void resetFilters() {
    _sales = "All";
    _applyFilters();
  }

  List<CustomerDeposit> buildCustomerTable(List<PaymentDetailsModel> deposits) {
    final depositMap = calculateDeposits(deposits);

    List<CustomerDeposit> result = [];

    depositMap.forEach((customerId, data) {
      double todayEgp = data['todayEgp'];
      double monthEgp = data['monthEgp'];
      double todayUsd = data['todayUsd'];
      double monthUsd = data['monthUsd'];

      result.add(
        CustomerDeposit(
          customer: parseToInt(customerId).toString(),
          customerName: data['CustomerName'] ?? "",
          salesRepName: data['SalesName'] ?? "",
          todayDepositEgp: NumberFormat.decimalPattern().format(todayEgp),
          monthDepositEgp: NumberFormat.decimalPattern().format(monthEgp),
          todayDepositUsd: NumberFormat.decimalPattern().format(todayUsd),
          monthDepositUsd: NumberFormat.decimalPattern().format(monthUsd),
        ),
      );
    });

    result.sort((a, b) {
      int compareMonth =
          double.parse(b.monthDepositEgp.split(" ").first.replaceAll(",", ""))
              .compareTo(double.parse(
                  a.monthDepositEgp.split(" ").first.replaceAll(",", "")));

      if (compareMonth != 0) return compareMonth;

      return double.parse(
              b.todayDepositEgp.split(" ").first.replaceAll(",", ""))
          .compareTo(double.parse(
              a.todayDepositEgp.split(" ").first.replaceAll(",", "")));
    });

    return result;
  }

  Map<String, Map<String, dynamic>> calculateDeposits(
      List<PaymentDetailsModel> deposits) {
    Map<String, Map<String, dynamic>> result = {};
    DateTime today = DateTime.now();

    for (var item in deposits) {
      String customer = item.customer ?? "";
      String customerName = item.customerName ?? "";
      String sales = item.salesRepName ?? "";
      double amount = (item.amount ?? 0).toDouble();
      String currency = item.currency ?? "";

      DateTime date = DateTime.parse(item.postingDate!);

      result.putIfAbsent(
          customer,
          () => {
                "todayEgp": 0.0,
                "monthEgp": 0.0,
                "todayUsd": 0.0,
                "monthUsd": 0.0,
                "CustomerName": customerName,
                "SalesName": sales
              });

      bool isThisMonth = date.year == today.year && date.month == today.month;

      bool isToday = isThisMonth && date.day == today.day;

      if (currency == "EGP") {
        if (isThisMonth) {
          result[customer]!["monthEgp"] += amount;
        }

        if (isToday) {
          result[customer]!["todayEgp"] += amount;
        }
      } else if (currency == "USD") {
        if (isThisMonth) {
          result[customer]!["monthUsd"] += amount;
        }

        if (isToday) {
          result[customer]!["todayUsd"] += amount;
        }
      }
    }

    return result;
  }
}

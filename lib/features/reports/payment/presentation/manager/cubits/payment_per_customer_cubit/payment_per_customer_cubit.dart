import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/payer/data/models/payer_model.dart';
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

  Future<void> getPaymentPerCustomer(DateTime fromDate, DateTime toDate) async {
    emit(PaymentPerCustomerLoading());
    final deposits =
        await paymentsRepo.fetchPaymentDetailsData(fromDate, toDate);
    deposits
        .fold((failure) => emit(PaymentPerCustomerFailure(error: failure.msg)),
            (paymentDetails) async {
      List<CustomerDeposit> customerDeposite =
          buildCustomerTable(paymentDetails);
      emit(PaymentPerCustomerSuccess(customerDeposit: customerDeposite));
    });
  }
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

    return double.parse(b.todayDepositEgp.split(" ").first.replaceAll(",", ""))
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

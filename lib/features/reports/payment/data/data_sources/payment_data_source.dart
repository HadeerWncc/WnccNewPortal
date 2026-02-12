import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';

abstract class PaymentDataSource {
  Future<List<Payment>> fetchPaymentDataPerBank(int mode, DateTime date);
  Future<List<PaymentDetailsModel>> fetchPaymentDetailsData(
      DateTime fromDate, DateTime toDate);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final ApiService apiService;

  PaymentDataSourceImpl({required this.apiService});
  @override
  Future<List<Payment>> fetchPaymentDataPerBank(int mode, DateTime date) async {
    var result = await apiService.get(
        endPoint: 'api/Reports/GetPaymentBanks?mode=$mode&date=$date');
    List<Payment> payments = [];
    for (var payment in result["data"]) {
      Payment paymentPerBank = Payment.fromJson(payment);
      payments.add(paymentPerBank);
    }
    return payments;
  }

  @override
  Future<List<PaymentDetailsModel>> fetchPaymentDetailsData(
      DateTime fromDate, DateTime toDate) async {
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetPaymentDetails?fromDate=$fromDate&toDate=$toDate');
    List<PaymentDetailsModel> paymentDetailsList = [];
    for (var paymentDetail in result["data"]) {
      PaymentDetailsModel paymentDetailModel =
          PaymentDetailsModel.fromJson(paymentDetail);
      paymentDetailsList.add(paymentDetailModel);
    }
    return paymentDetailsList;
  }
}

import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';

abstract class PaymentsRepo {
  Future<Either<Failure, List<Payment>>> getPaymentPerBanks(int mode, DateTime date);
  Future<Either<Failure, List<PaymentDetailsModel>>> fetchPaymentDetailsData(DateTime fromDate, DateTime toDate);
}
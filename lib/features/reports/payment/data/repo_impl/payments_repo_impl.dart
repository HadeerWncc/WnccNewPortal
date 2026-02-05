import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/payment/data/data_sources/payment_data_source.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

class PaymentsRepoImpl extends PaymentsRepo {
  final PaymentDataSource paymentDataSource;

  PaymentsRepoImpl({required this.paymentDataSource});
  @override
  Future<Either<Failure, List<PaymentDetailsModel>>> fetchPaymentDetailsData(
      DateTime fromDate, DateTime toDate) async {
    try {
      List<PaymentDetailsModel> paymentsDFetails =
          await paymentDataSource.fetchPaymentDetailsData(fromDate, toDate);
      return Right(paymentsDFetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Payment>>> getPaymentPerBanks(
      int mode, DateTime date) async {
    try {
      List<Payment> payments =
          await paymentDataSource.fetchPaymentDataPerBank(mode, date);
      return Right(payments);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

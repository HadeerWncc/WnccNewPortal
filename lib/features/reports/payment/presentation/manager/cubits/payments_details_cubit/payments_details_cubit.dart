import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

part 'payments_details_state.dart';

class PaymentsDetailsCubit extends Cubit<PaymentsDetailsState> {
  PaymentsDetailsCubit(this.paymentsRepo) : super(PaymentsDetailsInitial());
  final PaymentsRepo paymentsRepo;

  Future<void> getPaymentDetails(DateTime fromDate, DateTime toDate) async {
    emit(PaymentsDetailsLoading());
    final result = await paymentsRepo.fetchPaymentDetailsData(fromDate, toDate);
    result.fold(
      (failure) => emit(PaymentsDetailsFailure(errorMsg: failure.msg)),
      (paymentDetails) => emit(PaymentsDetailsSuccess(paymentDetails: paymentDetails)),
    );
  }
}

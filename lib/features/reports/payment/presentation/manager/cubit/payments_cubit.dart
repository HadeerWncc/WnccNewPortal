import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit(this.paymentsRepo) : super(PaymentsInitial());
  final PaymentsRepo paymentsRepo;

  Future<void> fetchPayments(int mode, DateTime date) async {
    emit(PaymentsLoading());
    final payments = await paymentsRepo.getPaymentPerBanks(mode, date);
    payments.fold(
      (failure) => emit(PaymentsFailure(failure.toString())),
      (paymentsData) => emit(PaymentsSuccess(paymentsData)),
    );
  }
}

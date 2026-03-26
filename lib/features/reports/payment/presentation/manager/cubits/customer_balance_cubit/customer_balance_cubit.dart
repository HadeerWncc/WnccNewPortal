import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/payment/data/models/customer_balance.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

part 'customer_balance_state.dart';

class CustomerBalanceCubit extends Cubit<CustomerBalanceState> {
  CustomerBalanceCubit(this.paymentsRepo) : super(CustomerBalanceInitial());
  final PaymentsRepo paymentsRepo;

  Future<void> getPaymentBalance() async {
    emit(CustomerBalanceLoading());
    print('before${DateTime.now().millisecond}');
    final result = await paymentsRepo.fetchPaymentBalanceData();
    print('after${DateTime.now().millisecond}');

    result.fold(
      (failure) => emit(CustomerBalanceFailure(error: failure.msg)),
      (paymentBalance) =>
          emit(CustomerBalanceSuccess(customerBalance: paymentBalance)),
    );
  }
}

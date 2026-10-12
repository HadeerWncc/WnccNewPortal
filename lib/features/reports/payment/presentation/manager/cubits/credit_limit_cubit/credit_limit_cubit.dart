import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/payment/data/models/credit_limit/credit_limit/credit_limit.dart';
import 'package:wncc_portal/features/reports/payment/domain/repos/payments_repo.dart';

part 'credit_limit_state.dart';

class CreditLimitCubit extends Cubit<CreditLimitState> {
  CreditLimitCubit(this.paymentsRepo) : super(CreditLimitInitial());
  final PaymentsRepo paymentsRepo;

  Future<void> getCreditLimit() async {
    emit(CreditLimitLoading());
    final result = await paymentsRepo.getCreditLimitData();
    result.fold(
      (failure) => emit(CreditLimitFailure(error: failure.msg)),
      (creditLimit) => emit(CreditLimitSuccess(creditLimit: creditLimit)),
    );
  }
}

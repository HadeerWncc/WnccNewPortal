import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/payer/data/models/payer_model.dart';
import 'package:wncc_portal/features/payer/domain/repos/payer_repo.dart';

part 'payer_state.dart';

class PayerCubit extends Cubit<PayerState> {
  PayerCubit(this.payerRepo) : super(PayerInitial());
  final PayerRepo payerRepo;

  Future<void> getAllPayers() async {
    emit(PayerLoading());
    var result = await payerRepo.getAllPayer();
    result.fold((error) {
      emit(PayerFailure(error: error.msg));
    }, (payers) {
      emit(PayerSuccess(payerModel: payers));
    });
  }
}

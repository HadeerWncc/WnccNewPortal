import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';
import 'package:wncc_portal/features/reports/pending/domain/repos/pending_repo.dart';

part 'pending_state.dart';

class PendingCubit extends Cubit<PendingState> {
  PendingCubit(this.pendingRepo) : super(PendingInitial());

  final PendingRepo pendingRepo;

  Future getPendingDelivery() async {
    emit(PendingLoading());
    var result = await pendingRepo.getPendingDelivery();
    result.fold((error) {
      emit(PendingFailure(error: error.msg));
    }, (pendingDelivery) {
      emit(PendingSuccess(pendingDelivery: pendingDelivery));
    });
  }
}

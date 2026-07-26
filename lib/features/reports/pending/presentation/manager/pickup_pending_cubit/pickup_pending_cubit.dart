import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';
import 'package:wncc_portal/features/reports/pending/domain/repos/pending_repo.dart';

part 'pickup_pending_state.dart';

class PickupPendingCubit extends Cubit<PickupPendingState> {
  PickupPendingCubit(this.pendingRepo) : super(PickupPendingInitial());

  final PendingRepo pendingRepo;

  Future getPendingPickup() async {
    emit(PickupPendingLoading());
    var result = await pendingRepo.getPendingPickup();
    result.fold((error) {
      emit(PickupPendingFailure(error: error.msg));
    }, (pendingDelivery) {
      emit(PickupPendingSuccess(pendingPickup: pendingDelivery));
    });
  }
}

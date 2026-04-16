import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/repositories/pickup_repo.dart';

part 'get_pickup_summary_state.dart';

class GetPickupSummaryCubit extends Cubit<GetPickupSummaryState> {
  GetPickupSummaryCubit(this.pickupRepo) : super(GetPickupSummaryInitial());

  final PickupRepo pickupRepo;

  Future<void> getPickupSummary(GetSummaryEntity getpicSummaryEntity) async {
    emit(GetPickupSummaryLoading());
    var result = await pickupRepo.getPickupSummary(getpicSummaryEntity);
    result.fold((error) {
      emit(GetPickupSummaryFailure(error: error.msg));
    }, (summary) {
      emit(GetPickupSummarySuccess(prioritySummaryModel: summary));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'get_delivery_summary_state.dart';

class GetDeliverySummaryCubit extends Cubit<GetDeliverySummaryState> {
  GetDeliverySummaryCubit(this.deliveryRepo) : super(GetDeliverySummaryInitial());

   final DeliveryRepo deliveryRepo;

  Future<void> getDeliverySummary(GetSummaryEntity getpicSummaryEntity) async {
    emit(GetDeliverySummaryLoading());
    var result = await deliveryRepo.getDeliverySummary(getpicSummaryEntity);
    result.fold((error) {
      emit(GetDeliverySummaryFailure(error: error.msg));
    }, (summary) {
      emit(GetDeliverySummarySuccess(prioritySummaryModel: summary));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/summary/domain/entities/priority_summary_entity.dart';
import 'package:wncc_portal/features/priority/summary/domain/repositories/priority_summary_repo.dart';

part 'summary_priority_state.dart';

class SummaryPriorityCubit extends Cubit<SummaryPriorityState> {
  SummaryPriorityCubit(this.prioritySummaryRepo)
      : super(SummaryPriorityInitial());
  final PrioritySummaryRepo prioritySummaryRepo;
  Future<void> getPickupSummary(DateTime fDate, DateTime tDate) async {
    emit(SummaryPriorityLoading());
    var result = await prioritySummaryRepo.getPrioritySummary(fDate, tDate);
    result.fold((error) {
      emit(SummaryPriorityFailure(error: error.msg));
    }, (summary) {
      List<PrioritySummaryEntity> bagsPrioritySummary = [];
      List<PrioritySummaryEntity> bulkPrioritySummary = [];
      for (var s in summary) {
        bagsPrioritySummary.add(
          PrioritySummaryEntity(
            salesName: s.salesName ?? '',
            pickupQuota: (s.pickupBagsQuota ?? 0),
            deliveryQuota: (s.deliveryBagsQuota ?? 0),
            pickupPriority: s.pickupBagsPriority ?? 0,
            deliveryPriority: s.deliveryBagsPriority ?? 0,
            totalQuota: (s.totalBagsQuota ?? 0),
            totalPriority: s.totalBagsPriority ?? 0,
          ),
        );

        bulkPrioritySummary.add(PrioritySummaryEntity(
            salesName: s.salesName ?? '',
            pickupQuota:
                (s.pickupBulkQuota ?? 0),
            deliveryQuota:
                (s.deliveryBulkQuota ?? 0),
            pickupPriority: s.pickupBulkPriority ?? 0,
            deliveryPriority: s.deliveryBulkPriority ?? 0,
            totalQuota: (s.totalBulkQuota ?? 0),
            totalPriority: s.totalBulkPriority ?? 0));
      }
      emit(SummaryPrioritySuccess(
        bagsPrioritySummary: bagsPrioritySummary,
        bulkPrioritySummary: bulkPrioritySummary,
      ));
    });
  }
}

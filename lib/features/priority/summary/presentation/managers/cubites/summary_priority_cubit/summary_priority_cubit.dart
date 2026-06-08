import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/summary/domain/entities/priority_summary_entity.dart';
import 'package:wncc_portal/features/priority/summary/domain/repositories/priority_summary_repo.dart';

part 'summary_priority_state.dart';

class SummaryPriorityCubit extends Cubit<SummaryPriorityState> {
  SummaryPriorityCubit(this.prioritySummaryRepo)
      : super(SummaryPriorityInitial());
  final PrioritySummaryRepo prioritySummaryRepo;
  Future<void> getPrioritySummary(DateTime fDate, DateTime tDate) async {
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
              deliveryDispatch: s.deliveryBagsDispatch ?? 0,
              pickupDispatch: s.pickupBagsDispatch ?? 0,
              totalDispatch: s.totalBagsDispatch ?? 0),
        );

        bulkPrioritySummary.add(PrioritySummaryEntity(
          salesName: s.salesName ?? '',
          pickupQuota: (s.pickupBulkQuota ?? 0),
          deliveryQuota: (s.deliveryBulkQuota ?? 0),
          pickupPriority: s.pickupBulkPriority ?? 0,
          deliveryPriority: s.deliveryBulkPriority ?? 0,
          totalQuota: (s.totalBulkQuota ?? 0),
          totalPriority: s.totalBulkPriority ?? 0,
          deliveryDispatch: s.deliveryBulkDispatch ?? 0,
          pickupDispatch: s.pickupBulkDispatch ?? 0,
          totalDispatch: s.totalBulkDispatch ?? 0,
        ));
      }

      bagsPrioritySummary.add(
        PrioritySummaryEntity(
          salesName: "Total",
          pickupQuota: summary.fold(
              0, (total, item) => total + (item.pickupBagsQuota ?? 0)),
          deliveryQuota: summary.fold(
              0, (total, item) => total + (item.deliveryBagsQuota ?? 0)),
          pickupPriority: summary.fold(
              0, (total, item) => total + (item.pickupBagsPriority ?? 0)),
          deliveryPriority: summary.fold(
              0, (total, item) => total + (item.deliveryBagsPriority ?? 0)),
          totalQuota: summary.fold(
              0, (total, item) => total + (item.totalBagsQuota ?? 0)),
          totalPriority: summary.fold(
              0, (total, item) => total + (item.totalBagsPriority ?? 0)),
          deliveryDispatch: summary.fold(
              0, (total, item) => total + (item.deliveryBagsDispatch ?? 0)),
          pickupDispatch: summary.fold(
              0, (total, item) => total + (item.pickupBagsDispatch ?? 0)),
          totalDispatch: summary.fold(
              0, (total, item) => total + (item.totalBagsDispatch ?? 0)),
        ),
      );

      bulkPrioritySummary.add(
        PrioritySummaryEntity(
          salesName: "Total",
          pickupQuota: summary.fold(
              0, (total, item) => total + (item.pickupBulkQuota ?? 0)),
          deliveryQuota: summary.fold(
              0, (total, item) => total + (item.deliveryBulkQuota ?? 0)),
          pickupPriority: summary.fold(
              0, (total, item) => total + (item.pickupBulkPriority ?? 0)),
          deliveryPriority: summary.fold(
              0, (total, item) => total + (item.deliveryBulkPriority ?? 0)),
          totalQuota: summary.fold(
              0, (total, item) => total + (item.totalBulkQuota ?? 0)),
          totalPriority: summary.fold(
              0, (total, item) => total + (item.totalBulkPriority ?? 0)),
          deliveryDispatch: summary.fold(
              0, (total, item) => total + (item.deliveryBulkDispatch ?? 0)),
          pickupDispatch: summary.fold(
              0, (total, item) => total + (item.pickupBulkDispatch ?? 0)),
          totalDispatch: summary.fold(
              0, (total, item) => total + (item.totalBulkDispatch ?? 0)),
        ),
      );
      emit(SummaryPrioritySuccess(
        bagsPrioritySummary: bagsPrioritySummary,
        bulkPrioritySummary: bulkPrioritySummary,
      ));
    });
  }
}

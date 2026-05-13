part of 'summary_priority_cubit.dart';

sealed class SummaryPriorityState extends Equatable {
  const SummaryPriorityState();

  @override
  List<Object> get props => [];
}

final class SummaryPriorityInitial extends SummaryPriorityState {}

final class SummaryPriorityLoading extends SummaryPriorityState {}

final class SummaryPrioritySuccess extends SummaryPriorityState {
  final List<PrioritySummaryEntity> bagsPrioritySummary;
  final List<PrioritySummaryEntity> bulkPrioritySummary;

  const SummaryPrioritySuccess({
    required this.bagsPrioritySummary,
    required this.bulkPrioritySummary,
  });
}

final class SummaryPriorityFailure extends SummaryPriorityState {
  final String error;

  const SummaryPriorityFailure({required this.error});
}

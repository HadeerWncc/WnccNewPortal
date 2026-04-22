part of 'get_pickup_summary_cubit.dart';

sealed class GetPickupSummaryState extends Equatable {
  const GetPickupSummaryState();

  @override
  List<Object> get props => [];
}

final class GetPickupSummaryInitial extends GetPickupSummaryState {}

final class GetPickupSummaryLoading extends GetPickupSummaryState {}

final class GetPickupSummaryFailure extends GetPickupSummaryState {
  final String error;

  const GetPickupSummaryFailure({required this.error});
}

final class GetPickupSummarySuccess extends GetPickupSummaryState {
  final PrioritySummaryModel prioritySummaryModel;

  const GetPickupSummarySuccess({required this.prioritySummaryModel});
}

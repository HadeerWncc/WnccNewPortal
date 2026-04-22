part of 'get_delivery_summary_cubit.dart';

sealed class GetDeliverySummaryState extends Equatable {
  const GetDeliverySummaryState();

  @override
  List<Object> get props => [];
}

final class GetDeliverySummaryInitial extends GetDeliverySummaryState {}

final class GetDeliverySummaryLoading extends GetDeliverySummaryState {}

final class GetDeliverySummaryFailure extends GetDeliverySummaryState {
  final String error;

  const GetDeliverySummaryFailure({required this.error});
}

final class GetDeliverySummarySuccess extends GetDeliverySummaryState {
  final PrioritySummaryModel prioritySummaryModel;

  const GetDeliverySummarySuccess({required this.prioritySummaryModel});
}

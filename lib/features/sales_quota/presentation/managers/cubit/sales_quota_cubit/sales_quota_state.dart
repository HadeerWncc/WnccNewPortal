part of 'sales_quota_cubit.dart';

abstract class SalesQuotaState extends Equatable {
  const SalesQuotaState();

  @override
  List<Object> get props => [];
}

class SalesQuotaInitial extends SalesQuotaState {}

class SalesQuotaloading extends SalesQuotaState {}

class SalesQuotaFailure extends SalesQuotaState {
  final String error;

  const SalesQuotaFailure({required this.error});
}

class SalesQuotaSuccess extends SalesQuotaState {
  final DailyQuotaModel dailyQuotaModel;

  const SalesQuotaSuccess({required this.dailyQuotaModel});
}

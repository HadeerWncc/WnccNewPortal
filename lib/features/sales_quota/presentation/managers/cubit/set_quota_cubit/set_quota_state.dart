part of 'set_quota_cubit.dart';

sealed class SetQuotaState extends Equatable {
  const SetQuotaState();

  @override
  List<Object> get props => [];
}

final class SetQuotaInitial extends SetQuotaState {}

final class SetQuotaSuccess extends SetQuotaState {
  final String message;

  const SetQuotaSuccess({required this.message});
}

final class SetQuotaFailure extends SetQuotaState {
  final String error;

  const SetQuotaFailure({required this.error});
}

final class SetQuotaLoading extends SetQuotaState {}

final class CopyQuotaLoading extends SetQuotaState {}

final class CopyQuotaFailure extends SetQuotaState {
  final String error;

  const CopyQuotaFailure({required this.error});
}

final class CopyQuotaSuccess extends SetQuotaState {
  final String message;

  const CopyQuotaSuccess({required this.message});
}

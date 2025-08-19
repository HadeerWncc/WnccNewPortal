part of 'delete_complain_cubit.dart';

sealed class DeleteComplainState extends Equatable {
  const DeleteComplainState();

  @override
  List<Object> get props => [];
}

final class DeleteComplainInitial extends DeleteComplainState {}

final class DeleteComplainloading extends DeleteComplainState {}

final class DeleteComplainFailure extends DeleteComplainState {
  final String error;

  const DeleteComplainFailure({required this.error});
}

final class DeleteComplainSuccess extends DeleteComplainState {
  final String msg;

  const DeleteComplainSuccess({required this.msg});
}

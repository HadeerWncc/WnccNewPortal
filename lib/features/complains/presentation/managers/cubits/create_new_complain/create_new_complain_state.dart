part of 'create_new_complain_cubit.dart';

sealed class CreateNewComplainState extends Equatable {
  const CreateNewComplainState();

  @override
  List<Object> get props => [];
}

final class CreateNewComplainInitial extends CreateNewComplainState {}

final class CreateNewComplainLoading extends CreateNewComplainState {}

final class CreateNewComplainFailure extends CreateNewComplainState {
  final String error;

  const CreateNewComplainFailure({required this.error});
}

final class CreateNewComplainSuccess extends CreateNewComplainState {
  final String msg;

  const CreateNewComplainSuccess({required this.msg});
}

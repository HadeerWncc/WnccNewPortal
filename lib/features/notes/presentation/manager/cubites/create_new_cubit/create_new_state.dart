part of 'create_new_cubit.dart';

sealed class CreateNewState extends Equatable {
  const CreateNewState();

  @override
  List<Object> get props => [];
}

final class CreateNewInitial extends CreateNewState {}

final class CreateNewLoading extends CreateNewState {}

final class CreateNewFailure extends CreateNewState {
  final String error;

  const CreateNewFailure({required this.error});
}

final class CreateNewSuccess extends CreateNewState {
  final String msg;

  const CreateNewSuccess({required this.msg});
}

part of 'create_update_cubit.dart';

sealed class CreateUpdateState extends Equatable {
  const CreateUpdateState();

  @override
  List<Object> get props => [];
}

final class CreateUpdateInitial extends CreateUpdateState {}

final class CreateUpdateLoading extends CreateUpdateState {}

final class CreateUpdateSuccess extends CreateUpdateState {
  final bool isCreated;
  const CreateUpdateSuccess({required this.isCreated});

  @override
  List<Object> get props => [isCreated];
}

final class CreateUpdateFailure extends CreateUpdateState {
  final String errorMessage;
  const CreateUpdateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

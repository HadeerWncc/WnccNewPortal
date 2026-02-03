part of 'updates_cubit.dart';

sealed class UpdatesState extends Equatable {
  const UpdatesState();

  @override
  List<Object> get props => [];
}

final class UpdatesInitial extends UpdatesState {}

final class UpdatesLoading extends UpdatesState {}

final class UpdatesSuccess extends UpdatesState {
  final List<UpdatesModel> updates;
  const UpdatesSuccess({required this.updates});

  @override
  List<Object> get props => [updates];
}

final class UpdatesFailure extends UpdatesState {
  final String errorMessage;
  const UpdatesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

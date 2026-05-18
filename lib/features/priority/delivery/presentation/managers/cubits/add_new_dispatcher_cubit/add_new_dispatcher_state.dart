part of 'add_new_dispatcher_cubit.dart';

sealed class AddNewDispatcherState extends Equatable {
  const AddNewDispatcherState();

  @override
  List<Object> get props => [];
}

final class AddNewDispatcherInitial extends AddNewDispatcherState {}
final class AddNewDispatcherLoading extends AddNewDispatcherState {}
final class AddNewDispatcherFailure extends AddNewDispatcherState {
  final String error;

  const AddNewDispatcherFailure({required this.error});
}
final class AddNewDispatcherSuccess extends AddNewDispatcherState {
  final String msg;

  const AddNewDispatcherSuccess({required this.msg});
}

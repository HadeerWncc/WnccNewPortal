part of 'edit_dispatcher_name_cubit.dart';

sealed class EditDispatcherNameState extends Equatable {
  const EditDispatcherNameState();

  @override
  List<Object> get props => [];
}

final class EditDispatcherNameInitial extends EditDispatcherNameState {}

final class EditDispatcherNameLoading extends EditDispatcherNameState {}

final class EditDispatcherNameFailure extends EditDispatcherNameState {
  final String errorMsg;

  const EditDispatcherNameFailure({required this.errorMsg});
}

final class EditDispatcherNameSuccess extends EditDispatcherNameState {
  final String msg;

  const EditDispatcherNameSuccess({required this.msg});
}

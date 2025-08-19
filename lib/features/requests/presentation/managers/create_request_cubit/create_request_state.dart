part of 'create_request_cubit.dart';

sealed class CreateRequestState extends Equatable {
  const CreateRequestState();

  @override
  List<Object> get props => [];
}

final class CreateRequestInitial extends CreateRequestState {}

final class CreateRequestLoading extends CreateRequestState {}

final class CreateRequestSuccess extends CreateRequestState {
  final String msg;

  const CreateRequestSuccess({required this.msg});
}

final class CreateRequestFailure extends CreateRequestState {
  final String error;

  const CreateRequestFailure({required this.error});
}

part of 'delete_agent_cubit.dart';

sealed class DeleteAgentState extends Equatable {
  const DeleteAgentState();

  @override
  List<Object> get props => [];
}

final class DeleteAgentInitial extends DeleteAgentState {}
final class DeleteAgentLoading extends DeleteAgentState {}
final class DeleteAgentFailure extends DeleteAgentState {
  final String errorMsg;

  const DeleteAgentFailure({required this.errorMsg});
}
final class DeleteAgentSuccess extends DeleteAgentState {
  final String msg;

  const DeleteAgentSuccess({required this.msg});
}

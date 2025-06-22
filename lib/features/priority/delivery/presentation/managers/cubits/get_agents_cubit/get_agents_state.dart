part of 'get_agents_cubit.dart';

sealed class GetAgentsState extends Equatable {
  const GetAgentsState();

  @override
  List<Object> get props => [];
}

final class GetAgentsInitial extends GetAgentsState {}

final class GetAgentsLoading extends GetAgentsState {}

final class GetAgentsFailure extends GetAgentsState {
  final String error;

  const GetAgentsFailure({required this.error});
}

final class GetAgentsSuccess extends GetAgentsState {
  final List<String> agents;

  const GetAgentsSuccess({required this.agents});
}

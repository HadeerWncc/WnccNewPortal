part of 'complains_cubit.dart';

sealed class ComplainsState extends Equatable {
  const ComplainsState();

  @override
  List<Object> get props => [];
}

final class ComplainsInitial extends ComplainsState {}

final class ComplainsLoading extends ComplainsState {}

final class ComplainsFailure extends ComplainsState {
  final String error;

  const ComplainsFailure({required this.error});
}

final class ComplainsSuccess extends ComplainsState {
  final List<ComplainEntity> complains;

  const ComplainsSuccess({required this.complains});
}

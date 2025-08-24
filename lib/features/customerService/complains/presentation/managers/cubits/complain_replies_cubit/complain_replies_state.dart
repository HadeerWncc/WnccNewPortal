part of 'complain_replies_cubit.dart';

sealed class ComplainRepliesState extends Equatable {
  const ComplainRepliesState();

  @override
  List<Object> get props => [];
}

final class ComplainRepliesInitial extends ComplainRepliesState {}
final class ComplainRepliesLoading extends ComplainRepliesState {}
final class ComplainRepliesFailure extends ComplainRepliesState {
  final String error;

  const ComplainRepliesFailure({required this.error});
}
final class ComplainRepliesSuccess extends ComplainRepliesState {
  final List<MessageDto> messages;
  const ComplainRepliesSuccess({required this.messages});
}

part of 'delete_note_cubit.dart';

sealed class DeleteNoteState extends Equatable {
  const DeleteNoteState();

  @override
  List<Object> get props => [];
}

final class DeleteNoteInitial extends DeleteNoteState {}
final class DeleteNoteLoading extends DeleteNoteState {}
final class DeleteNoteFailure extends DeleteNoteState {
  final String error;

  const DeleteNoteFailure({required this.error});
}
final class DeleteNoteSuccess extends DeleteNoteState {
  final String msg;

  const DeleteNoteSuccess({required this.msg});
}

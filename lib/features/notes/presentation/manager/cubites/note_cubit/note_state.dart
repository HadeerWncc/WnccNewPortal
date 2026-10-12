part of 'note_cubit.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteFailure extends NoteState {
  final String error;

  const NoteFailure({required this.error});
}

final class NoteSuccess extends NoteState {
  final NoteModel noteModel;

  const NoteSuccess({required this.noteModel});
}

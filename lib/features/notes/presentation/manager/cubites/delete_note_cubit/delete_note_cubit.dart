import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/notes/domain/repos/notes_repo.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit(this.notesRepo) : super(DeleteNoteInitial());

  final NotesRepo notesRepo;

  Future deleteNote(String id) async {
    emit(DeleteNoteLoading());
    var result = await notesRepo.deleteNote(id);
    result.fold((error) {
      emit(DeleteNoteFailure(error: error.msg));
    }, (result) {
      result == true
          ? emit(const DeleteNoteSuccess(msg: 'Note deleted successfully'))
          : emit(const DeleteNoteFailure(
              error: 'Something went wrong, Please try again!'));
    });
  }
}

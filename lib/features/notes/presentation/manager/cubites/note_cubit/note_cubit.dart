import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/note_model.dart';
import 'package:wncc_portal/features/notes/domain/repos/notes_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.notesRepo) : super(NoteInitial());

  final NotesRepo notesRepo;

  Future getNotes(String id, int pageNum, int pageSize) async {
    emit(NoteLoading());
    var result = await notesRepo.getNotesOfUser(id, pageNum, pageSize);
    result.fold((error) {
      emit(NoteFailure(error: error.msg));
    }, (notes) {
      emit(NoteSuccess(noteModel: notes));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/notes/domain/entites/note_action_entity.dart';
import 'package:wncc_portal/features/notes/domain/repos/notes_repo.dart';

part 'create_new_state.dart';

class CreateNewCubit extends Cubit<CreateNewState> {
  CreateNewCubit(this.notesRepo) : super(CreateNewInitial());

  final NotesRepo notesRepo;

  Future addNewNote(NoteActionEntity noteEntity) async {
    emit(CreateNewLoading());
    var result = await notesRepo.createNewNote(noteEntity);
    result.fold((error) {
      emit(CreateNewFailure(error: error.msg));
    }, (result) {
      result == true
          ? emit(const CreateNewSuccess(msg: 'Note added successfully'))
          : emit(const CreateNewFailure(
              error: 'Something went wrong, Please try again!'));
    });
  }
}

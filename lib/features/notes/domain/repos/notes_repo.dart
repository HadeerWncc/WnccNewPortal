import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/note_model.dart';
import 'package:wncc_portal/features/notes/domain/entites/note_action_entity.dart';

abstract class NotesRepo {
  Future<Either<Failure, NoteModel>> getNotesOfUser(
      String id, int pageNum, int pageSize);

  Future<Either<Failure, bool>> createNewNote(NoteActionEntity noteEntity);
  Future<Either<Failure, bool>> deleteNote(String id);
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/notes/data/data_source/note_data_source.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/note_model.dart';
import 'package:wncc_portal/features/notes/domain/entites/note_action_entity.dart';
import 'package:wncc_portal/features/notes/domain/repos/notes_repo.dart';

class NotesRepoImpl extends NotesRepo {
  final NoteDataSource noteDataSource;

  NotesRepoImpl({required this.noteDataSource});
  @override
  Future<Either<Failure, NoteModel>> getNotesOfUser(
      String id, int pageNum, int pageSize) async {
    try {
      NoteModel result =
          await noteDataSource.getNotesOfUser(id, pageNum, pageSize);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewNote(
      NoteActionEntity noteEntity) async {
    try {
      bool result = await noteDataSource.createNewNote(noteEntity);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteNote(String id) async{
     try {
      bool result = await noteDataSource.deleteNote(id);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

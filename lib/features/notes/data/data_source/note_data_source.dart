import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/note_model.dart';
import 'package:wncc_portal/features/notes/domain/entites/note_action_entity.dart';

abstract class NoteDataSource {
  Future<NoteModel> getNotesOfUser(String userId, int pageNum, int pageSize);
  Future<bool> createNewNote(NoteActionEntity noteEntity);
  Future<bool> deleteNote(String id);
}

class NoteDataSourceImpl extends NoteDataSource {
  final ApiService apiService;

  NoteDataSourceImpl({required this.apiService});
  @override
  Future<NoteModel> getNotesOfUser(
      String userId, int pageNum, int pageSize) async {
    String endPoint =
        'api/Notes/Search?UserId=$userId&PageNumber=$pageNum&PageSize=$pageSize';
    var result = await apiService.get(
      endPoint: endPoint,
    );
    NoteModel notes = NoteModel.fromJson(result["data"]);
    return notes;
  }

  @override
  Future<bool> createNewNote(NoteActionEntity noteEntity) async {
    String endPoint = 'api/Notes/Create';
    var result = await apiService.post(
      endPoint: endPoint,
      data: noteEntity.toJson(),
    );
    bool successed = result["successed"] as bool;
    return successed;
  }

  @override
  Future<bool> deleteNote(String id) async{
    String endPoint = 'api/Notes/Delete?id=$id';
    var result = await apiService.delete(
      endPoint: endPoint,
    );
    bool successed = result["successed"] as bool;
    return successed;
  }
}

import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/home/updates/data/models/updates_model/updates_model.dart';

abstract class UpdateDataSource {
  Future<List<UpdatesModel>> getAllUpdates();
  Future<bool> createUpdate(String content, List<int>? attachment);
}

class UpdateDataSourceImpl extends UpdateDataSource {
  final ApiService apiService;

  UpdateDataSourceImpl({required this.apiService});

  @override
  Future<List<UpdatesModel>> getAllUpdates() async {
    var result = await apiService.get(endPoint: 'api/Updates/GetAll');
    List<UpdatesModel> updatesList = [];
    for (var update in result["data"]) {
      UpdatesModel updatesModel = UpdatesModel.fromJson(update);
      updatesList.add(updatesModel);
    }
    return updatesList;
  }

  @override
  Future<bool> createUpdate(String content, List<int>? attachment) {
    // TODO: implement createUpdate
    throw UnimplementedError();
  }
}

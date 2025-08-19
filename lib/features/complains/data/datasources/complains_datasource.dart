import 'package:dio/dio.dart';
import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/complains/data/models/complain_details_model/complain_details_model.dart';
import 'package:wncc_portal/features/complains/data/models/complain_model.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/create_complain_entity.dart';

abstract class ComplainsDatasource {
  Future<List<ComplainEntity>> getAllComplain();
  Future<String> createNewComplain(CreateComplainEntity createComplainEntity);
  Future<String> editComplain(CreateComplainEntity createComplainEntity);
  Future<String> deleteComplain(String id);
  Future<ComplainDetailsEntity> getComplainById(String id);
  Future<ComplainDetailsEntity> openComplain(String id); //Pending
}

class ComplainsDatasourceImpl extends ComplainsDatasource {
  final ApiService apiService;

  ComplainsDatasourceImpl({required this.apiService});
  @override
  Future<List<ComplainEntity>> getAllComplain() async {
    var result = await apiService.get(
      endPoint: 'api/Supports/GetAllComplaints',
    );
    List<ComplainEntity> complainEntityList = [];
    for (var complain in result["data"]) {
      ComplainModel complainModel = ComplainModel.fromJson(complain);
      complainEntityList.add(complainModel.toEntity());
    }
    return complainEntityList;
  }

  @override
  Future<String> createNewComplain(
      CreateComplainEntity createComplainEntity) async {
    final formData = FormData.fromMap({
      "Subject": createComplainEntity.subject,
      "Type": createComplainEntity.type,
      "Description": createComplainEntity.description,
      "ContactPerson": createComplainEntity.contactPerson,
      "ContactPhone": createComplainEntity.contactPhone,
      "Level": createComplainEntity.level,
      "Images": null,
      "PayerId": createComplainEntity.payerId,
    });
    var result = await apiService.post(
      endPoint: 'api/Supports/CreateComplaint',
      data: formData,
    );
    String msg = result["message"] as String;
    return msg;
  }

  @override
  Future<String> editComplain(CreateComplainEntity createComplainEntity) async {
    final formData = FormData.fromMap({
      "Id": createComplainEntity.id,
      "Subject": createComplainEntity.subject,
      "Type": createComplainEntity.type,
      "Description": createComplainEntity.description,
      "ContactPerson": createComplainEntity.contactPerson,
      "ContactPhone": createComplainEntity.contactPhone,
      "Level": createComplainEntity.level,
      "Images": null,
      "PayerId": createComplainEntity.payerId,
    });
    var result = await apiService.put(
      endPoint: 'api/Supports/UpdateComplaint',
      data: formData,
    );
    String msg = result["message"] as String;
    return msg;
  }

  @override
  Future<String> deleteComplain(String id) async {
    var result = await apiService.put(
      endPoint: 'api/Supports/ToggleComplaint?id=$id',
    );
    String msg = result["message"] as String;

    return msg;
  }

  @override
  Future<ComplainDetailsEntity> getComplainById(String complainId) async {
    var result = await apiService.get(
        endPoint: 'api/Supports/GetComplaint?id=$complainId');
    ComplainDetailsModel complainDetailsModel =
        ComplainDetailsModel.fromJson(result["data"]);
    ComplainDetailsEntity complainDetailsEntity =
        complainDetailsModel.toEntity();
    return complainDetailsEntity;
  }

  @override
  Future<ComplainDetailsEntity> openComplain(String id) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/OpenComplaint',
      data: {"id": id},
    );
    ComplainDetailsModel complainDetailsModel =
        ComplainDetailsModel.fromJson(result["data"]);
    ComplainDetailsEntity complainDetailsEntity =
        complainDetailsModel.toEntity();
    return complainDetailsEntity;
  }
}

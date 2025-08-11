import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/data/models/request/request.dart';
import 'package:wncc_portal/features/requests/data/models/request_details_model/request_details_model.dart';
import 'package:wncc_portal/features/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';

abstract class RequestsDataSource {
  Future<List<RequestEntity>> getAllRequests();
  Future<RequestDetailsEntity> getRequestById(String id);
  Future<List<ForwardUser>> getForwardedUsersById(String id);
  Future<List<MessageDto>> getRequestRepliesById(String id);
  Future<String> createNewRequest(CreateRequestEntity requestEntity);
  Future<RequestDetailsEntity> openRequest(String id);
}

class RequestsDataSourceImpl extends RequestsDataSource {
  final ApiService apiService;

  RequestsDataSourceImpl({required this.apiService});
  @override
  Future<List<RequestEntity>> getAllRequests() async {
    var result = await apiService.get(
      endPoint: 'api/Supports/GetAllRequests',
    );
    List<RequestEntity> requestEntityList = [];
    for (var request in result["data"]) {
      Request requestModel = Request.fromJson(request);
      requestEntityList.add(requestModel.toEntity());
    }
    return requestEntityList;
  }

  @override
  Future<RequestDetailsEntity> getRequestById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/Supports/GetRequest?id=$id',
    );
    RequestDetailsModel requestDetails =
        RequestDetailsModel.fromJson(result["data"]);
    RequestDetailsEntity requestDetailsEntity = requestDetails.toEntity();
    return requestDetailsEntity;
  }

  @override
  Future<List<ForwardUser>> getForwardedUsersById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/Supports/GetRequestForwardedUsers?id=$id',
    );
    List<ForwardUser> forwardedUsers = [];
    for (var forward in result["data"]) {
      ForwardUser forwardUser = ForwardUser.fromJson(forward);
      forwardedUsers.add(forwardUser);
    }
    return forwardedUsers;
  }

  @override
  Future<List<MessageDto>> getRequestRepliesById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/Supports/GetRequestReplies?id=$id',
    );
    List<MessageDto> requestReplies = [];
    for (var reply in result["data"]) {
      MessageDto forwardUser = MessageDto.fromJsonRequest(reply);
      requestReplies.add(forwardUser);
    }
    return requestReplies;
  }

  @override
  Future<String> createNewRequest(CreateRequestEntity requestEntity) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/CreateRequest',
      data: {
        "description": requestEntity.description,
        "contactPerson": requestEntity.contactPerson,
        "contactPhone": requestEntity.contactPhone,
        "level": requestEntity.level,
        "delivery": requestEntity.delivery,
        "requestTypes": requestEntity.requestTypes,
        "payerId": requestEntity.payerId
      },
    );
    String msg = result["message"];
    return msg;
  }

  @override
  Future<RequestDetailsEntity> openRequest(String id) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/OpenRequest',
      data: {"id": id},
    );
    RequestDetailsModel requestDetails =
        RequestDetailsModel.fromJson(result["data"]);
    RequestDetailsEntity requestDetailsEntity = requestDetails.toEntity();
    return requestDetailsEntity;
  }
}

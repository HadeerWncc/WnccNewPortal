import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/request/request.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/request_details_model/request_details_model.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/change_request_log_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_entity.dart';

abstract class RequestsDataSource {
  Future<List<RequestEntity>> getAllRequests();
  Future<RequestDetailsEntity> getRequestById(String id);
  Future<List<ForwardUser>> getForwardedUsersById(String id);
  Future<List<MessageDto>> getRequestRepliesById(String id);
  Future<String> createNewRequest(CreateRequestEntity requestEntity);
  Future<String> editRequest(CreateRequestEntity requestEntity);
  Future<RequestDetailsEntity> openRequest(String id);
  Future<RequestDetailsEntity> closeRequest(String id, String result);
  Future<String> removeRequest(String id);
  Future<List<ForwardUser>> forwardRequest({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  });
  Future<RequestDetailsEntity> changeRequestLog(
      ChangeRequestLogEntity changeRequestLogEntity);
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

  @override
  Future<String> editRequest(CreateRequestEntity requestEntity) async {
    var result = await apiService.put(
      endPoint: 'api/Supports/UpdateRequest',
      data: {
        "id": requestEntity.id,
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
  Future<String> removeRequest(String id) async {
    var result = await apiService.put(
      endPoint: 'api/Supports/ToggleRequest?id=$id',
    );
    String msg = result["message"];
    return msg;
  }

  @override
  Future<List<ForwardUser>> forwardRequest({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  }) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/ForwardRequest',
      data: {
        "id": id,
        "forwardReason": forwardReason,
        "forwardUsers": forwardedUsers,
      },
    );
    List<ForwardUser> forwardedUsersList = [];
    for (var forward in result["data"]) {
      ForwardUser forwardUser = ForwardUser.fromJson(forward);
      forwardedUsersList.add(forwardUser);
    }
    return forwardedUsersList;
  }

  @override
  Future<RequestDetailsEntity> changeRequestLog(
      ChangeRequestLogEntity changeRequestLogEntity) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/CreateRequestLog',
      data: {
        "id": changeRequestLogEntity.requestId,
        "requestTypeId": changeRequestLogEntity.requestTypeId,
        "comment": changeRequestLogEntity.comment,
        "status": changeRequestLogEntity
            .status, //New = 0, Pending = 1, Forwarded = 2, FollowUp = 3, Resolved = 4, Rejected = 5, Cancelled = 6, Approve = 7, Completed = 8, Overdue = 9
        "checkedAll": changeRequestLogEntity
            .checkedAll, //true (if true you can send requestTypeId empty)
      },
    );
    RequestDetailsModel requestDetails =
        RequestDetailsModel.fromJson(result["data"]);
    RequestDetailsEntity requestDetailsEntity = requestDetails.toEntity();
    return requestDetailsEntity;
  }

  @override
  Future<RequestDetailsEntity> closeRequest(
      String id, String resultComment) async {
    var result = await apiService.post(
      endPoint: 'api/Supports/CloseRequest',
      data: {
        "id": id,
        "result": resultComment,
      },
    );
    RequestDetailsModel requestDetails =
        RequestDetailsModel.fromJson(result["data"]);
    RequestDetailsEntity requestDetailsEntity = requestDetails.toEntity();
    return requestDetailsEntity;
  }
}

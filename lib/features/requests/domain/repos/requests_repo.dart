import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/domain/entities/change_request_log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';

abstract class RequestsRepo {
  Future<Either<Failure, List<RequestEntity>>> getAllRequests();
  Future<Either<Failure, RequestDetailsEntity>> getRequestById(String id);
  Future<Either<Failure, List<ForwardUser>>> getForwardedUserById(String id);
  Future<Either<Failure, List<ForwardUser>>> forwardToUsers({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  });
  Future<Either<Failure, List<MessageDto>>> getRequestRepliesById(String id);
  Future<Either<Failure, String>> createNewRequest(
      CreateRequestEntity requestEntity);
  Future<Either<Failure, String>> editRequest(
      CreateRequestEntity requestEntity);
  Future<Either<Failure, String>> removeRequest(String id);
  Future<Either<Failure, RequestDetailsEntity>> openRequest(String id);
  Future<Either<Failure, RequestDetailsEntity>> closeRequest(
      String id, String resultComment);
  Future<Either<Failure, RequestDetailsEntity>> changeRequestLog(
      ChangeRequestLogEntity changeRequestLogEntity);
}

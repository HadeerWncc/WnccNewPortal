import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/requests/data/datasources/requests_data_source.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/domain/entities/change_request_log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

class RequestsRepoImpl extends RequestsRepo {
  final RequestsDataSource requestsDataSource;

  RequestsRepoImpl({required this.requestsDataSource});
  @override
  Future<Either<Failure, List<RequestEntity>>> getAllRequests() async {
    try {
      List<RequestEntity> requests = await requestsDataSource.getAllRequests();
      return Right(requests);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestDetailsEntity>> getRequestById(
      String id) async {
    try {
      RequestDetailsEntity requestDetails =
          await requestsDataSource.getRequestById(id);
      return Right(requestDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ForwardUser>>> getForwardedUserById(
      String id) async {
    try {
      List<ForwardUser> forwarded =
          await requestsDataSource.getForwardedUsersById(id);
      return Right(forwarded);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageDto>>> getRequestRepliesById(
      String id) async {
    try {
      List<MessageDto> replies =
          await requestsDataSource.getRequestRepliesById(id);
      return Right(replies);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createNewRequest(
      CreateRequestEntity requestEntity) async {
    try {
      String replies = await requestsDataSource.createNewRequest(requestEntity);
      return Right(replies);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestDetailsEntity>> openRequest(String id) async {
    try {
      RequestDetailsEntity requestDetails =
          await requestsDataSource.openRequest(id);
      return Right(requestDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editRequest(
      CreateRequestEntity requestEntity) async {
    try {
      String replies = await requestsDataSource.editRequest(requestEntity);
      return Right(replies);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeRequest(String id) async {
    try {
      String msg = await requestsDataSource.removeRequest(id);
      return Right(msg);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ForwardUser>>> forwardToUsers({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  }) async {
    try {
      List<ForwardUser> forwardUsers = await requestsDataSource.forwardRequest(
        id: id,
        forwardReason: forwardReason,
        forwardedUsers: forwardedUsers,
      );
      return Right(forwardUsers);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestDetailsEntity>> changeRequestLog(
      ChangeRequestLogEntity changeRequestLogEntity) async {
    try {
      RequestDetailsEntity requestDetails =
          await requestsDataSource.changeRequestLog(changeRequestLogEntity);
      return Right(requestDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestDetailsEntity>> closeRequest(
      String id, String resultComment) async {
    try {
      RequestDetailsEntity requestDetails =
          await requestsDataSource.closeRequest(id, resultComment);
      return Right(requestDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

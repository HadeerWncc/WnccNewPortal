import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/requests/data/datasources/requests_data_source.dart';
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
  Future<Either<Failure, RequestDetailsEntity>> getRequestById(String id) async {
    try {
      RequestDetailsEntity requestDetails = await requestsDataSource.getRequestById(id);
      return Right(requestDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

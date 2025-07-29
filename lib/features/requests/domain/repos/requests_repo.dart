import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';

abstract class RequestsRepo {
  Future<Either<Failure, List<RequestEntity>>> getAllRequests();
  Future<Either<Failure, RequestDetailsEntity>> getRequestById(String id);
}

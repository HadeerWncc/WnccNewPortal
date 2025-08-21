import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/complains/data/datasources/complains_datasource.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/create_complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

class ComplainRepoImpl extends ComplainRepo {
  final ComplainsDatasource complainsDatasource;

  ComplainRepoImpl({required this.complainsDatasource});
  @override
  Future<Either<Failure, List<ComplainEntity>>> getAllComplains() async {
    try {
      List<ComplainEntity> complains =
          await complainsDatasource.getAllComplain();
      return Right(complains);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createNewComplain(
      CreateComplainEntity createComplainEntity) async {
    try {
      String msg =
          await complainsDatasource.createNewComplain(createComplainEntity);
      return Right(msg);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editComplain(
      CreateComplainEntity createComplainEntity) async {
    try {
      String msg = await complainsDatasource.editComplain(createComplainEntity);
      return Right(msg);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteComplain(String complainId) async {
    try {
      String msg = await complainsDatasource.deleteComplain(complainId);
      return Right(msg);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ComplainDetailsEntity>> getComplainById(
      String complainId) async {
    try {
      ComplainDetailsEntity complain =
          await complainsDatasource.getComplainById(complainId);
      return Right(complain);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ComplainDetailsEntity>> openComplain(
      String complainId) async {
    try {
      ComplainDetailsEntity complain =
          await complainsDatasource.openComplain(complainId);
      return Right(complain);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ForwardUser>>> getForwardedUser(
      String complainId) async {
    try {
      List<ForwardUser> forwardedUsers =
          await complainsDatasource.getComplaintForwardedUsers(complainId);
      return Right(forwardedUsers);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageDto>>> getComplaintReplies(
      String complainId) async {
    try {
      List<MessageDto> messages =
          await complainsDatasource.getComplaintReplys(complainId);
      return Right(messages);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

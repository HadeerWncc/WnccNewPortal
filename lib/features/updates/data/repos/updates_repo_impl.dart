import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/updates/data/data_sources/update_data_source.dart';
import 'package:wncc_portal/features/updates/data/models/updates_model/updates_model.dart';
import 'package:wncc_portal/features/updates/domain/repos/updates_repo.dart';

class UpdatesRepoImpl extends UpdatesRepo {
  final UpdateDataSource updatesDataSource;

  UpdatesRepoImpl({required this.updatesDataSource});
  @override
  Future<Either<Failure, bool>> createUpdate(
      String content, List<int>? attachment) async {
    try {
      bool result = await updatesDataSource.createUpdate(content, attachment);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UpdatesModel>>> getAllUpdates() async {
    try {
      List<UpdatesModel> updates = await updatesDataSource.getAllUpdates();
      return Right(updates);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

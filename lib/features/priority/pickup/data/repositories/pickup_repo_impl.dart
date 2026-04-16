import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/pickup/data/datasources/pickup_data_source.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';
import 'package:wncc_portal/features/priority/pickup/domin/repositories/pickup_repo.dart';

class PickupRepoImpl extends PickupRepo {
  final PickupDataSource pickupDataSource;

  PickupRepoImpl({required this.pickupDataSource});
  @override
  Future<Either<Failure, List<PickupModel>>> getPickUpPriority(
      DateTime date) async {
    try {
      List<PickupModel> order = await pickupDataSource.getPickupPriority(date);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> makePickupility(
      MakePickupilityEntity makePickupility) async {
    try {
      String response =
          await pickupDataSource.makePickupilityEntity(makePickupility);
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PrioritySummaryModel>> getPickupSummary(
      GetSummaryEntity getpicSummaryEntity) async {
    try {
      PrioritySummaryModel pickupSummary =
          await pickupDataSource.getPickupSummary(getpicSummaryEntity);
      return Right(pickupSummary);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

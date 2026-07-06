import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/data_sources/dispatch_details_data_source.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';

class DispatchDetailsRepoImpl extends DispatchDetailsRepo {
  final DispatchDetailsDataSource dispatchDetailsDataSource;

  DispatchDetailsRepoImpl({required this.dispatchDetailsDataSource});
  @override
  Future<Either<Failure, List<DispatchDetailsPerRegionModel>>> getDispatchDetails(
    DateTime date,
    int zone,
  ) async {
    try {
      List<DispatchDetailsPerRegionModel> dispatchDetails =
          await dispatchDetailsDataSource.getDispatchDetails(date, zone);
      return Right(dispatchDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }


}

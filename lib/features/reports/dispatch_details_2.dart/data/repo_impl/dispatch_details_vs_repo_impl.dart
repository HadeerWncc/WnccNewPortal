import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/data_sources/dispatch_details_v2_data_source.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/repo/dispatch_details_vs_repo.dart';

class DispatchDetailsVsRepoImpl extends DispatchDetailsVsRepo {
  final DispatchDetailsV2DataSource dispatchDetailsDataSource;

  DispatchDetailsVsRepoImpl({required this.dispatchDetailsDataSource});
  @override
  Future<Either<Failure, List<DispatchDetailsVsModel>>> getDispatchDetailsPerSales(
    DateTime date,
    int zone,
  ) async {
    try {
      List<DispatchDetailsVsModel> dispatchDetails =
          await dispatchDetailsDataSource.getDispatchDetailsPerSales(date, zone);
      return Right(dispatchDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<DispatchDetailsVsModel>>> getDispatchDetailsPerCustomer(DateTime date, int zone) async {
    try {
      List<DispatchDetailsVsModel> dispatchDetails =
          await dispatchDetailsDataSource.getDispatchDetailsPerCustomer(date, zone);
      return Right(dispatchDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  
}
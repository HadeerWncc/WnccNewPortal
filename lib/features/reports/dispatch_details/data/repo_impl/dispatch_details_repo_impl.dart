import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/data_sources/dispatch_details_data_source.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

class DispatchDetailsRepoImpl extends DispatchDetailsRepo{
  final DispatchDetailsDataSource dispatchDetailsDataSource;

  DispatchDetailsRepoImpl({required this.dispatchDetailsDataSource});
  @override
  Future<Either<Failure, List<DispatchDetailsModel>>> getDispatchDetails(DateTime date) async{
    try {
      List<DispatchDetailsModel> dispatchDetails =
          await dispatchDetailsDataSource.getDispatchDetails(date);
      return Right(dispatchDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ShipmentDetailsModel>>> getShipmentDetails() async{
    try {
      List<ShipmentDetailsModel> shipmentDetails =
          await dispatchDetailsDataSource.getShipmentDetails();
      return Right(shipmentDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
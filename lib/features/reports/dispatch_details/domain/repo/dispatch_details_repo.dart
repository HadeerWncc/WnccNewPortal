import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';

abstract class DispatchDetailsRepo {
  Future<Either<Failure, List<DispatchDetailsPerRegionModel>>> getDispatchDetails(
    DateTime date,
    int zone,
  );
  // Future<Either<Failure, List<ShipmentDetailsModel>>> getShipmentDetails();
  // Future<Either<Failure, List<DispatchDetailsModel>>>
  //     getDispatchDetailsPerCustomer(DateTime from, DateTime to);
  // Future<Either<Failure, List<DispatchDetailsModel>>>
  //     getDispatchDetailsPerSales(DateTime from, DateTime to);
}

import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';

abstract class DispatchDetailsRepo {
  Future<Either<Failure, List<DispatchDetailsModel>>> getDispatchDetails(DateTime date);
  Future<Either<Failure, List<ShipmentDetailsModel>>> getShipmentDetails();
}
import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';

abstract class DispatchDetailsVsRepo {
  Future<Either<Failure, List<DispatchDetailsVsModel>>>
      getDispatchDetailsPerSales(
    DateTime date,
    int zone,
  );
  Future<Either<Failure, List<DispatchDetailsVsModel>>>
      getDispatchDetailsPerCustomer(
    DateTime date,
    int zone,
  );
  Future<Either<Failure, List<DispatchDetailsPerRegionModel>>>
      getDispatchDetailsPerRegion(
    DateTime date,
    int zone,
  );
}

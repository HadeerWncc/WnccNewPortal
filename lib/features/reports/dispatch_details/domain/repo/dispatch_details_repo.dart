import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model2/dispatch_details_model2.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_customer_model/dispatch_per_customer_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_sales_model/dispatch_per_sales_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';

abstract class DispatchDetailsRepo {
  Future<Either<Failure, List<DispatchDetailsModel2>>> getDispatchDetails(
    DateTime date,
    int group,
  );
  Future<Either<Failure, List<ShipmentDetailsModel>>> getShipmentDetails();
  Future<Either<Failure, List<DispatchPerCustomerModel>>>
      getDispatchDetailsPerCustomer(DateTime from, DateTime to);
  Future<Either<Failure, List<DispatchPerSalesModel>>>
      getDispatchDetailsPerSales(DateTime from, DateTime to);
}

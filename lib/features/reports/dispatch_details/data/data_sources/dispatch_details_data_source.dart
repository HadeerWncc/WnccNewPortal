import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_customer_model/dispatch_per_customer_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_sales_model/dispatch_per_sales_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';

abstract class DispatchDetailsDataSource {
  Future<List<DispatchDetailsModel>> getDispatchDetails(DateTime date);
  Future<List<ShipmentDetailsModel>> getShipmentDetails();
  Future<List<DispatchPerSalesModel>> getDispatchDetailsPerSales(
      DateTime from, DateTime to);
  Future<List<DispatchPerCustomerModel>> getDispatchDetailsPerCustomer(
      DateTime from, DateTime to);
}

class DispatchDetailsDataSourceImpl extends DispatchDetailsDataSource {
  final ApiService apiService;

  DispatchDetailsDataSourceImpl({required this.apiService});
  @override
  Future<List<DispatchDetailsModel>> getDispatchDetails(DateTime date) async {
    var result = await apiService.get(
        endPoint: 'api/Reports/GetRegionDispatchDetails?date=$date');
    List<DispatchDetailsModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchDetailsModel dispatchDetailsModel =
          DispatchDetailsModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }

  @override
  Future<List<ShipmentDetailsModel>> getShipmentDetails() async {
    var result =
        await apiService.get(endPoint: 'api/Reports/GetShipmentDetails');
    List<ShipmentDetailsModel> shipmentDetailsList = [];
    for (var dispach in result["data"]) {
      ShipmentDetailsModel shipmentDetailsModel =
          ShipmentDetailsModel.fromJson(dispach);
      shipmentDetailsList.add(shipmentDetailsModel);
    }
    return shipmentDetailsList;
  }

  @override
  Future<List<DispatchPerCustomerModel>> getDispatchDetailsPerCustomer(
      DateTime from, DateTime to) async {
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetCustomerDispatchDetails?fromDate=$from&toDate=$to');
    List<DispatchPerCustomerModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchPerCustomerModel dispatchDetailsModel =
          DispatchPerCustomerModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }

  @override
  Future<List<DispatchPerSalesModel>> getDispatchDetailsPerSales(
      DateTime from, DateTime to) async {
    var result = await apiService.get(
        endPoint:
            'api/Reports/GetSalesDispatchDetails?fromDate=$from&toDate=$to');
    List<DispatchPerSalesModel> dispatchDetailsList = [];
    for (var dispach in result["data"]) {
      DispatchPerSalesModel dispatchDetailsModel =
          DispatchPerSalesModel.fromJson(dispach);
      dispatchDetailsList.add(dispatchDetailsModel);
    }
    return dispatchDetailsList;
  }
}

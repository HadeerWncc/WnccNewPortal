import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/customerService/complains/data/models/complain_model.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/request/request.dart';
import 'package:wncc_portal/features/payer/data/models/daily_details_model/daily_details_model.dart';
import 'package:wncc_portal/features/payer/data/models/date_details_model/date_details_model.dart';
import 'package:wncc_portal/features/payer/data/models/payer_model.dart';
import 'package:wncc_portal/features/payer/data/models/payer_monthly_details/payer_monthly_details.dart';
import 'package:wncc_portal/features/payer/data/models/payer_target/payer_target.dart';
import 'package:wncc_portal/features/payer/domain/entities/add_payer_entity.dart';
import 'package:wncc_portal/features/payer/domain/entities/update_target_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';

abstract class PayerDatasource {
  //Get
  Future<List<PayerModel>> getAll();
  Future<PayerModel> getPayerById(String id);
  Future<PayerMonthlyDetails> getMonthlyDetails(String id, String date);
  Future<DateDetailsModel> getDateDetails(String id, String date, int mode);
  Future<DailyDetailsModel> getDailyDetails(String id, String date);
  Future<List<ComplainModel>> getPayerComplains(
      String id, String date, int mode);
  Future<PayerTarget> getPayerTarget(String id, String date);
  Future<List<Request>> getPayerRequest(String id, String date, int mode);
  Future<List<PendingOrder>> getPayerPendingOrders(String id);
  //Post
  Future<bool> addPayer(AddPayerEntity addPayerEntity);
  //Generate Pass Key ???

  //Put
  //Update Payer  ???
  Future<bool> updateTarget(UpdateTargetEntity updateTargetEntity);
  Future<bool> togglePayerActivation(String id, String activation);
  Future<bool> togglePricing(String id);

}

class PayerDatasourceImpl extends PayerDatasource {
  final ApiService apiService;

  PayerDatasourceImpl({required this.apiService});
  @override
  Future<List<PayerModel>> getAll() async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetAll',
    );
    List<PayerModel> payers = [];
    for (var payer in result["data"]) {
      PayerModel payerModel = PayerModel.fromJson(payer);
      payers.add(payerModel);
    }
    return payers;
  }

  @override
  Future<PayerModel> getPayerById(String id) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetPayer?id=$id',
    );
    PayerModel payer = PayerModel.fromJson(result["data"]);
    return payer;
  }

  @override
  Future<PayerMonthlyDetails> getMonthlyDetails(String id, String date) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetMonthlyDetails?id=$id&date=$date',
    );
    PayerMonthlyDetails payerMonthlyDetails =
        PayerMonthlyDetails.fromJson(result["data"]);
    return payerMonthlyDetails;
  }

  @override
  Future<DateDetailsModel> getDateDetails(
      String id, String date, int mode) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetDateDetails?id=$id&mode=$mode&date=$date',
    );
    DateDetailsModel dateDetails = DateDetailsModel.fromJson(result["data"]);
    return dateDetails;
  }

  @override
  Future<DailyDetailsModel> getDailyDetails(String id, String date) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetDateDetails?id=$id&date=$date',
    );
    DailyDetailsModel dailyDetails = DailyDetailsModel.fromJson(result["data"]);
    return dailyDetails;
  }

  @override
  Future<List<ComplainModel>> getPayerComplains(
      String id, String date, int mode) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetPayerComplaints?id=$id&date=$date&mode=$mode',
    );
    List<ComplainModel> complains = [];
    for (var complain in result["data"]) {
      ComplainModel complainModel = ComplainModel.fromJson(complain);
      complains.add(complainModel);
    }
    return complains;
  }

  @override
  Future<PayerTarget> getPayerTarget(String id, String date) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetPayerTarget?id=$id&date=$date',
    );
    PayerTarget payerTarget = PayerTarget.fromJson(result["data"]);
    return payerTarget;
  }

  @override
  Future<List<Request>> getPayerRequest(
      String id, String date, int mode) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetPayerRequests?id=$id&mode=$mode&date=$date',
    );
    List<Request> requests = [];
    for (var request in result["data"]) {
      Request requestModel = Request.fromJson(request);
      requests.add(requestModel);
    }
    return requests;
  }

  @override
  Future<List<PendingOrder>> getPayerPendingOrders(String id) async {
    var result = await apiService.get(
      endPoint: 'api/Payers/GetPayerPendingOrders?id=$id',
    );
    List<PendingOrder> pendingOrders = [];
    for (var pendingOrder in result["data"]) {
      PendingOrder pendingOrderModel = PendingOrder.fromJson(pendingOrder);
      pendingOrders.add(pendingOrderModel);
    }
    return pendingOrders;
  }

  @override
  Future<bool> updateTarget(UpdateTargetEntity updateTargetEntity) async {
    var result = await apiService.put(
      endPoint: 'api/Payers/UpdateTarget',
      data: {
        "payerId": updateTargetEntity.payerId,
        "bags": updateTargetEntity.bags,
        "bulk": updateTargetEntity.bulk
      },
    );
    bool success = result["successed"] as bool;
    return success;
  }
  
  @override
  Future<bool> togglePayerActivation(String id, String activation) async{
    var result = await apiService.put(
      endPoint: 'api/Payers/TogglePayerActivation?id=$id&activation=$activation',
    );
    bool success = result["successed"] as bool;
    return success;
  }
  
  @override
  Future<bool> togglePricing(String id) async{
     var result = await apiService.put(
      endPoint: 'api/Payers/TogglePricing?id=$id',
    );
    bool success = result["successed"] as bool;
    return success;
  }
  
  @override
  Future<bool> addPayer(AddPayerEntity addPayerEntity) async{
     var result = await apiService.post(
      endPoint: 'api/Payers/Create',
      data: addPayerEntity.toJson(),
    );
    bool success = result["successed"] as bool;
    return success;
  }
}

import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
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

abstract class PayerRepo {
  //Get
  Future<Either<Failure, List<PayerModel>>> getAllPayer();
  Future<Either<Failure, PayerModel>> getPayerById(String id);
  Future<Either<Failure, PayerMonthlyDetails>> getMonthlyDetails(
    String id,
    String date,
  );
  Future<Either<Failure, DateDetailsModel>> getDateDetails(
    String id,
    String date,
    int mode,
  );
  Future<Either<Failure, DailyDetailsModel>> getDailyDetails(
    String id,
    String date,
  );
  Future<Either<Failure, List<ComplainModel>>> getPayerComplains(
    String id,
    String date,
    int mode,
  );
  Future<Either<Failure, PayerTarget>> getPayerTarget(String id, String date);
  Future<Either<Failure, List<Request>>> getPayerRequest(
    String id,
    String date,
    int mode,
  );
  Future<Either<Failure, List<PendingOrder>>> getPayerPendingOrders(String id);
  //Post
  Future<Either<Failure, bool>> addPayer(AddPayerEntity addPayerEntity);
  //Generate Pass Key ???

  //Put
  //Update Payer  ???
  Future<Either<Failure, bool>> updateTarget(
      UpdateTargetEntity updateTargetEntity);
  Future<Either<Failure, bool>> togglePayerActivation(
      String id, String activation);
  Future<Either<Failure, bool>> togglePricing(String id);
}

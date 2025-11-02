import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/customerService/complains/data/models/complain_model.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/request/request.dart';
import 'package:wncc_portal/features/payer/data/data_sources/payer_datasource.dart';
import 'package:wncc_portal/features/payer/data/models/daily_details_model/daily_details_model.dart';
import 'package:wncc_portal/features/payer/data/models/date_details_model/date_details_model.dart';
import 'package:wncc_portal/features/payer/data/models/payer_model.dart';
import 'package:wncc_portal/features/payer/data/models/payer_monthly_details/payer_monthly_details.dart';
import 'package:wncc_portal/features/payer/data/models/payer_target/payer_target.dart';
import 'package:wncc_portal/features/payer/domain/entities/add_payer_entity.dart';
import 'package:wncc_portal/features/payer/domain/entities/update_target_entity.dart';
import 'package:wncc_portal/features/payer/domain/repos/payer_repo.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';

class PayerRepoImpl extends PayerRepo {
  final PayerDatasource payerDatasource;

  PayerRepoImpl({required this.payerDatasource});
  @override
  Future<Either<Failure, bool>> addPayer(AddPayerEntity addPayerEntity) async {
    try {
      bool success = await payerDatasource.addPayer(addPayerEntity);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PayerModel>>> getAllPayer() async {
    try {
      List<PayerModel> payers = await payerDatasource.getAll();
      return Right(payers);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyDetailsModel>> getDailyDetails(
      String id, String date) async {
    try {
      DailyDetailsModel dailyDetails =
          await payerDatasource.getDailyDetails(id, date);
      return Right(dailyDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DateDetailsModel>> getDateDetails(
      String id, String date, int mode) async {
    try {
      DateDetailsModel dateDetails =
          await payerDatasource.getDateDetails(id, date, mode);
      return Right(dateDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PayerMonthlyDetails>> getMonthlyDetails(
      String id, String date) async {
    try {
      PayerMonthlyDetails monthlyDetails =
          await payerDatasource.getMonthlyDetails(id, date);
      return Right(monthlyDetails);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PayerModel>> getPayerById(String id) async {
    try {
      PayerModel payer = await payerDatasource.getPayerById(id);
      return Right(payer);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ComplainModel>>> getPayerComplains(
      String id, String date, int mode) async {
    try {
      List<ComplainModel> comlains =
          await payerDatasource.getPayerComplains(id, date, mode);
      return Right(comlains);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PendingOrder>>> getPayerPendingOrders(
      String id) async {
    try {
      List<PendingOrder> pendingOrders =
          await payerDatasource.getPayerPendingOrders(id);
      return Right(pendingOrders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Request>>> getPayerRequest(
      String id, String date, int mode) async {
    try {
      List<Request> requests =
          await payerDatasource.getPayerRequests(id, date, mode);
      return Right(requests);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PayerTarget>> getPayerTarget(
      String id, String date) async {
    try {
      PayerTarget payerTarget = await payerDatasource.getPayerTarget(id, date);
      return Right(payerTarget);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> togglePayerActivation(
      String id, String activation) async {
    try {
      bool success =
          await payerDatasource.togglePayerActivation(id, activation);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> togglePricing(String id) async {
    try {
      bool success = await payerDatasource.togglePricing(id);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTarget(
      UpdateTargetEntity updateTargetEntity) async {
    try {
      bool success = await payerDatasource.updateTarget(updateTargetEntity);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

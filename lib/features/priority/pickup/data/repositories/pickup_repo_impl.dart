import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/datasources/pickup_data_source.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

class PickupRepoImpl extends PickupRepo {
  final PickupDataSource pickupDataSource;

  PickupRepoImpl({required this.pickupDataSource});
  @override
  Future<Either<Failure, bool>> addPickupPriority(List<String> orderIds) async{
    try {
      bool success = await pickupDataSource.addPickupPriority(orderIds);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deletepickupPriority(List<String> orderIds) async{
    try {
      bool success = await pickupDataSource.deletePickupPriority(orderIds);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> dispatchPickupOrders(List<String> orders) async{
    try {
      bool success = await pickupDataSource.dispatchPickupOrders(orders);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DispatchPickupOrder>>> getDispatchPickupByDate(String date) async{
    try {
      List<DispatchPickupOrder> orders = await pickupDataSource.getDispatchPickupOrdersByDate(date);
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DispatchPickupOrder>> getDispatchPickupById(String id) async{
    try {
      DispatchPickupOrder order = await pickupDataSource.getDispatchPickupOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PendingOrder>>> getPendingPickupOrders() async{
    try {
      List<PendingOrder> orders = await pickupDataSource.getPendingPickupOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PendingOrder>> getPendingPickupOrdersById(String id) async{
    try {
      PendingOrder order = await pickupDataSource.getPendingPickupOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PriorityPickupOrder>> getPriorityPickupById(String id) async{
    try {
      PriorityPickupOrder order = await pickupDataSource.getPriorityPickupOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PriorityPickupOrder>>> getPriorityPickupOrders() async{
    try {
      List<PriorityPickupOrder> orders = await pickupDataSource.getPriorityPickupOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> undispatchPickupOrders(List<String> orders) async {
      try {
      bool success = await pickupDataSource.undispatchPickupOrders(orders);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
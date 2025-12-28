import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/pickup/data/datasources/pickup_data_source.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

class PickupRepoImpl extends PickupRepo {
  final PickupDataSource pickupDataSource;

  PickupRepoImpl({required this.pickupDataSource});
  @override
  Future<Either<Failure, bool>> priorityPickupOrder(
      List<String> orderIds) async {
    try {
      bool success = await pickupDataSource.priorityPickupOrder(orderIds);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> pindingPickupOrder(
      List<String> orderIds) async {
    try {
      bool success = await pickupDataSource.pendingPickupOrder(orderIds);
      return Right(success);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> dispatchPickupOrders(
      List<String> orders) async {
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
  Future<Either<Failure, List<OrderResponse>>> getDispatchPickupByDate(
      String date) async {
    try {
      List<OrderResponse> orders =
          await pickupDataSource.getDispatchPickupOrdersByDate(date);
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, DispatchPickupOrder>> getDispatchPickupById(
  //     String id) async {
  //   try {
  //     DispatchPickupOrder order =
  //         await pickupDataSource.getDispatchPickupOrdersById(id);
  //     return Right(order);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(msg: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, List<OrderResponse>>> getPendingPickupOrders() async {
    try {
      List<OrderResponse> orders =
          await pickupDataSource.getPendingPickupOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, PendingOrder>> getPendingPickupOrdersById(
  //     String id) async {
  //   try {
  //     PendingOrder order =
  //         await pickupDataSource.getPendingPickupOrdersById(id);
  //     return Right(order);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(msg: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, PriorityPickupOrder>> getPriorityPickupById(
  //     String id) async {
  //   try {
  //     PriorityPickupOrder order =
  //         await pickupDataSource.getPriorityPickupOrdersById(id);
  //     return Right(order);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(msg: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, List<OrderResponse>>> getPriorityPickupOrders() async {
    try {
      List<OrderResponse> orders =
          await pickupDataSource.getPriorityPickupOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, bool>> undispatchPickupOrders(
  //     List<String> orders) async {
  //   try {
  //     bool success = await pickupDataSource.undispatchPickupOrders(orders);
  //     return Right(success);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(msg: e.toString()));
  //   }
  // }
}

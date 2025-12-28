import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/delivery/data/datasources/delivery_data_source.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

class DeliveryRepoImpl extends DeliveryRepo {
  final DeliveryDataSource deliveryDataSource;

  DeliveryRepoImpl({required this.deliveryDataSource});
  @override
  Future<Either<Failure, bool>> makeDeliveryPriority(
      List<String> orderIds, bool asTruck) async {
    try {
      bool successed =
          await deliveryDataSource.makeDeliveryPriority(orderIds, asTruck);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> makeDeliveryPending(
      List<String> orderIds) async {
    try {
      bool successed = await deliveryDataSource.makeDeliveryPending(orderIds);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> dispatchDeliveryOrders(
      List<DispatchDeliveryEntity> orders) async {
    try {
      bool successed = await deliveryDataSource.dispatchDeliveryOrders(orders);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderResponse>>> getDispatchDeliveryOrdersByDate(
      String date) async {
    try {
      List<OrderResponse> orders =
          await deliveryDataSource.getDispatchDeliveryOrdersByDate(date);
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderResponse>>>
      getPendingDeliveryOrders() async {
    try {
      List<OrderResponse> orders =
          await deliveryDataSource.getPendingDeliveryOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderResponse>>>
      getPriorityDeliveryOrders() async {
    try {
      List<OrderResponse> order =
          await deliveryDataSource.getPriorityDeliveryOrders();
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDispatchAgents() async {
    try {
      List<String> agents = await deliveryDataSource.getDispatchAgents();
      return Right(agents);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}

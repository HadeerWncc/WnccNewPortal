import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/datasources/delivery_data_source.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/dispatched_delivery_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_order.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

class DeliveryRepoImpl extends DeliveryRepo {
  final DeliveryDataSource deliveryDataSource;

  DeliveryRepoImpl({required this.deliveryDataSource});
  @override
  Future<Either<Failure, bool>> addDeliveryPriority(
      List<String> orderIds, bool asTruck) async {
    try {
      bool successed =
          await deliveryDataSource.addDeliveryPriority(orderIds, asTruck);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDeliveryPriority(
      List<String> orderIds) async {
    try {
      bool successed =
          await deliveryDataSource.deleteDeliveryPriority(orderIds);
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
      List<String> orders, String agent) async {
    try {
      bool successed =
          await deliveryDataSource.dispatchDeliveryOrders(orders, agent);
      return Right(successed);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DispatchedDeliveryOrder>>>
      getDispatchDeliveryOrders() async {
    try {
      List<DispatchedDeliveryOrder> orders =
          await deliveryDataSource.getDispatchDeliveryOrders();
      return Right(orders);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DispatchedDeliveryOrder>>>
      getDispatchDeliveryOrdersByDate(String date) async {
    try {
      List<DispatchedDeliveryOrder> orders =
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
  Future<Either<Failure, DispatchedDeliveryOrder>>
      getDispatchDeliveryOrdersById(String id) async {
    try {
      DispatchedDeliveryOrder order =
          await deliveryDataSource.getDispatchDeliveryOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PendingOrder>>> getPendingDeliveryOrders() async {
    try {
      List<PendingOrder> orders =
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
  Future<Either<Failure, PendingOrder>> getPendingDeliveryOrdersById(
      String id) async {
    try {
      PendingOrder order =
          await deliveryDataSource.getPendingDeliveryOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PriorityDeliveryOrder>>>
      getPriorityDeliveryOrders() async {
    try {
      List<PriorityDeliveryOrder> order =
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
  Future<Either<Failure, PriorityDeliveryOrder>> getPriorityDeliveryOrdersById(
      String id) async {
    try {
      PriorityDeliveryOrder order =
          await deliveryDataSource.getPriorityDeliveryOrdersById(id);
      return Right(order);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> undispatchDeliveryOrders(
      List<String> orders) async {
    try {
      bool successed =
          await deliveryDataSource.undispatchDeliveryOrders(orders);
      return Right(successed);
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

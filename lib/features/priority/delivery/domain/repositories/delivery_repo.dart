import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryRepo {
  Future<Either<Failure, List<OrderResponse>>> getPendingDeliveryOrders();
  // Future<Either<Failure, PendingOrder>> getPendingDeliveryOrdersById(String id);
  Future<Either<Failure, List<OrderResponse>>>
      getPriorityDeliveryOrders();
  // Future<Either<Failure, PriorityDeliveryOrder>> getPriorityDeliveryOrdersById(
  //     String id);
  // Future<Either<Failure, OrderResponse>>
  //     getDispatchDeliveryOrdersById(String id);
  Future<Either<Failure, List<OrderResponse>>>
      getDispatchDeliveryOrdersByDate(String date);
  Future<Either<Failure, bool>> makeDeliveryPriority(
      List<String> orderIds, bool asTruck);
  Future<Either<Failure, bool>> makeDeliveryPending(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchDeliveryOrders(
      List<DispatchDeliveryEntity> orders);
  // Future<Either<Failure, bool>> undispatchDeliveryOrders(List<String> orders);
  Future<Either<Failure, List<String>>> getDispatchAgents();
}

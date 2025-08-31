import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/dispatched_delivery_order.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_order.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryRepo {
  Future<Either<Failure, List<PendingOrder>>> getPendingDeliveryOrders();
  Future<Either<Failure, PendingOrder>> getPendingDeliveryOrdersById(String id);
  Future<Either<Failure, List<PriorityDeliveryOrder>>>
      getPriorityDeliveryOrders();
  Future<Either<Failure, PriorityDeliveryOrder>> getPriorityDeliveryOrdersById(
      String id);
  Future<Either<Failure, List<DispatchedDeliveryOrder>>>
      getDispatchDeliveryOrders();
  Future<Either<Failure, DispatchedDeliveryOrder>>
      getDispatchDeliveryOrdersById(String id);
  Future<Either<Failure, List<DispatchedDeliveryOrder>>>
      getDispatchDeliveryOrdersByDate(String date);
  Future<Either<Failure, bool>> addDeliveryPriority(
      List<String> orderIds, bool asTruck);
  Future<Either<Failure, bool>> deleteDeliveryPriority(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchDeliveryOrders(
      List<DispatchDeliveryEntity> orders);
  Future<Either<Failure, bool>> undispatchDeliveryOrders(List<String> orders);
  Future<Either<Failure, List<String>>> getDispatchAgents();
}

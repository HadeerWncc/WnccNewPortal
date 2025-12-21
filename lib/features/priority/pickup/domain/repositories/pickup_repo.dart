import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';

abstract class PickupRepo {
  Future<Either<Failure, List<OrderResponse>>> getPendingPickupOrders();
  // Future<Either<Failure, PendingOrder>> getPendingPickupOrdersById(String id);
  Future<Either<Failure, List<OrderResponse>>> getPriorityPickupOrders();
  // Future<Either<Failure, PriorityPickupOrder>> getPriorityPickupById(String id);
  // Future<Either<Failure, DispatchPickupOrder>> getDispatchPickupById(String id);
  Future<Either<Failure, List<OrderResponse>>> getDispatchPickupByDate(
      String date);
  Future<Either<Failure, bool>> priorityPickupOrder(List<String> orderIds);
  Future<Either<Failure, bool>> pindingPickupOrder(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchPickupOrders(List<String> orders);
  // Future<Either<Failure, bool>> undispatchPickupOrders(List<String> orders);
}

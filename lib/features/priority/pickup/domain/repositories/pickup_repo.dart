import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';

abstract class PickupRepo {
  Future<Either<Failure, List<PendingOrder>>> getPendingPickupOrders();
  Future<Either<Failure, PendingOrder>> getPendingPickupOrdersById(String id);
  Future<Either<Failure, List<PriorityPickupOrder>>> getPriorityPickupOrders();
  Future<Either<Failure, PriorityPickupOrder>> getPriorityPickupById(String id);
  Future<Either<Failure, DispatchPickupOrder>> getDispatchPickupById(String id);
  Future<Either<Failure, List<DispatchPickupOrder>>> getDispatchPickupByDate(
      String date);
  Future<Either<Failure, bool>> addPickupPriority(List<String> orderIds);
  Future<Either<Failure, bool>> deletepickupPriority(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchPickupOrders(List<String> orders);
  Future<Either<Failure, bool>> undispatchPickupOrders(List<String> orders);
}

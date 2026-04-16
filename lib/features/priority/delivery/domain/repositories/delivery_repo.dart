import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryRepo {
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getPendingDeliveryOrders();
  // Future<Either<Failure, PendingOrder>> getPendingDeliveryOrdersById(String id);
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getPriorityDeliveryOrders();
  // Future<Either<Failure, PriorityDeliveryOrder>> getPriorityDeliveryOrdersById(
  //     String id);
  // Future<Either<Failure, OrderResponse>>
  //     getDispatchDeliveryOrdersById(String id);
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getDispatchDeliveryOrdersByDate(String fromDate, String toDate);
  Future<Either<Failure, bool>> makeDeliveryPriority(List<String> orderIds,
      bool asTruck, int prioritySource, DateTime? priorityDate);
  Future<Either<Failure, bool>> makeDeliveryPending(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchDeliveryOrders(
      List<DispatchDeliveryEntity> orders);
  // Future<Either<Failure, bool>> undispatchDeliveryOrders(List<String> orders);
  Future<Either<Failure, List<String>>> getDispatchAgents();
  Future<Either<Failure, PrioritySummaryModel>> getDeliverySummary(
      GetSummaryEntity getpicSummaryEntity);
}

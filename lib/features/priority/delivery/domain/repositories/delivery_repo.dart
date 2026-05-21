import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';

abstract class DeliveryRepo {
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getPendingDeliveryOrders();
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getPriorityDeliveryOrders();
  Future<Either<Failure, List<PriorityDeliveryModel>>>
      getDispatchDeliveryOrdersByDate(String date);
  Future<Either<Failure, bool>> makeDeliveryPriority(List<String> orderIds,
      bool asTruck, int prioritySource, DateTime? priorityDate);
  Future<Either<Failure, bool>> makeDeliveryPending(List<String> orderIds);
  Future<Either<Failure, bool>> dispatchDeliveryOrders(
      List<DispatchDeliveryEntity> orders);
  Future<Either<Failure, List<DispatchDeliveryEntity>>> getDispatchAgents();
  Future<Either<Failure, PrioritySummaryModel>> getDeliverySummary(
      GetSummaryEntity getpicSummaryEntity);
  Future<Either<Failure, bool>> addNewDispatcher(String dispatcher);
  Future<Either<Failure, bool>> editDispatcher(String dispatcherId,String dispatcherName);
  Future<Either<Failure, bool>> deleteDispatchers(List<String> dispatchers);
}

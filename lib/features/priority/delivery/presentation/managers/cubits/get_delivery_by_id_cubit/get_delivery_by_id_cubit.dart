import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'get_delivery_by_id_state.dart';

class GetDeliveryByIdCubit extends Cubit<GetDeliveryByIdState> {
  GetDeliveryByIdCubit(this.deliveryRepo) : super(GetDeliveryByIdInitial());

  final DeliveryRepo deliveryRepo;

  // Future<void> getPendingOrderDetails(String id) async {
  //   emit(GetDeliveryByIdLoading());
  //   var result = await deliveryRepo.getPendingDeliveryOrdersById(id);
  //   result.fold((error) {
  //     emit(GetDeliveryByIdFailure(error: error.msg));
  //   }, (order) {
  //     emit(GetDeliveryPendingByIdSuccess(pendingOrder: order));
  //   });
  // }

  // Future<void> getProiorityOrderDetails(String id) async {
  //   emit(GetDeliveryByIdLoading());
  //   var result = await deliveryRepo.getPriorityDeliveryOrdersById(id);
  //   result.fold((error) {
  //     emit(GetDeliveryByIdFailure(error: error.msg));
  //   }, (order) {
  //     emit(GetDeliveryPriorityByIdSuccess(priorityDeliveryOrder: order));
  //   });
  // }

  // Future<void> getDispatchOrderDetails(String id) async {
  //   emit(GetDeliveryByIdLoading());
  //   var result = await deliveryRepo.getDispatchDeliveryOrdersById(id);
  //   result.fold((error) {
  //     emit(GetDeliveryByIdFailure(error: error.msg));
  //   }, (order) {
  //     emit(GetDeliveryDispatchByIdSuccess(dispatchedDeliveryOrder: order));
  //   });
  // }
}

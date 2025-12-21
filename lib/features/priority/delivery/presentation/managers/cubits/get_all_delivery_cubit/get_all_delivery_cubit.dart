import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'get_all_delivery_state.dart';

class GetAllDeliveryCubit extends Cubit<GetAllDeliveryState> {
  GetAllDeliveryCubit(this.deliveryRepo) : super(GetAllDeliveryInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> getAllDeliveryPending() async {
    emit(GetAllDeliveryLoading());
    var result = await deliveryRepo.getPendingDeliveryOrders();
    result.fold((error) {
      emit(GetAllDeliveryFailure(error: error.msg));
    }, (order) {
      emit(GetAllPendingDeliverySuccess(pendingOrders: order));
    });
  }

  Future<void> getAllDeliveryPriorty() async {
    emit(GetAllDeliveryLoading());
    var result = await deliveryRepo.getPriorityDeliveryOrders();
    result.fold((error) {
      emit(GetAllDeliveryFailure(error: error.msg));
    }, (order) {
      emit(GetAllPriorityDeliverySuccess(priorityOrders: order));
    });
  }

  // Future<void> getAllDeliveryDispatch() async {
  //   emit(GetAllDeliveryLoading());
  //   var result = await deliveryRepo.getDispatchDeliveryOrders();
  //   result.fold((error) {
  //     emit(GetAllDeliveryFailure(error: error.msg));
  //   }, (order) {
  //     emit(GetAllDispatchDeliverySuccess(dispatchedOrders: order));
  //   });
  // }

  Future<void> getDeliveryDispatchByDate(String date) async {
    emit(GetAllDeliveryLoading());
    var result = await deliveryRepo.getDispatchDeliveryOrdersByDate(date);
    result.fold((error) {
      emit(GetAllDeliveryFailure(error: error.msg));
    }, (order) {
      emit(GetAllDispatchDeliverySuccess(dispatchedOrders: order));
    });
  }
}

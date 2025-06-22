import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'dispatch_delivery_order_state.dart';

class DispatchDeliveryOrderCubit extends Cubit<DispatchDeliveryOrderState> {
  DispatchDeliveryOrderCubit(this.deliveryRepo)
      : super(DispatchDeliveryOrderInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> dispatchDeliveryOrders(List<String> orders, String agent) async {
    emit(DispatchDeliveryOrderLoading());
    var result = await deliveryRepo.dispatchDeliveryOrders(orders, agent);
    result.fold((error) {
      emit(DispatchDeliveryOrderFailure(error: error.msg));
    }, (success) {
      if (success == true) {
        emit(const DispatchDeliveryOrderSuccess(
            msg: 'Orders dispatched successfuly'));
      } else {
        emit(const DispatchDeliveryOrderFailure(
          error: 'An error occurred, please try again!',
        ));
      }
    });
  }
}

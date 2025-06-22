import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'undispatch_delivery_order_state.dart';

class UndispatchDeliveryOrderCubit extends Cubit<UndispatchDeliveryOrderState> {
  UndispatchDeliveryOrderCubit(this.deliveryRepo)
      : super(UndispatchDeliveryOrderInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> undispatchDeliveryOrders(List<String> orders) async {
    emit(UndispatchDeliveryOrderLoading());
    var result = await deliveryRepo.undispatchDeliveryOrders(orders);
    result.fold((error) {
      emit(UndispatchDeliveryOrderFailure(error: error.msg));
    }, (success) {
      if (success == true) {
        emit(const UndispatchDeliveryOrderSuccess(
            msg: 'Orders undispatched successfuly'));
      } else {
        emit(const UndispatchDeliveryOrderFailure(
          error: 'An error occurred, please try again!',
        ));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'delete_delivery_priority_order_state.dart';

class DeleteDeliveryPriorityOrderCubit
    extends Cubit<DeleteDeliveryPriorityOrderState> {
  DeleteDeliveryPriorityOrderCubit(this.deliveryRepo)
      : super(DeleteDeliveryPriorityOrderInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> deleteDeliveryPriorityOrder(List<String> orders) async {
    emit(DeleteDeliveryPriorityOrderLoading());
    var result = await deliveryRepo.deleteDeliveryPriority(orders);
    result.fold((error) {
      emit(DeleteDeliveryPriorityOrderFailure(error: error.msg));
    }, (success) {
      if (success == true) {
        emit(const DeleteDeliveryPriorityOrderSuccess(
            msg: 'Orders deleted successfuly'));
      } else {
        emit(const DeleteDeliveryPriorityOrderFailure(
            error: 'An error occurred, please try again!'));
      }
    });
  }
}

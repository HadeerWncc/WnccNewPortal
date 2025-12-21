import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'add_delivery_priority_state.dart';

class AddDeliveryPriorityCubit extends Cubit<AddDeliveryPriorityState> {
  AddDeliveryPriorityCubit(this.deliveryRepo)
      : super(AddDeliveryPriorityInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> addDeliveryPriority(List<String> orders, bool asTruck) async {
    emit(AddDeliveryPriorityLoading());
    var result = await deliveryRepo.makeDeliveryPriority(orders, asTruck);
    result.fold((error) {
      emit(AddDeliveryPriorityFailure(error: error.msg));
    }, (success) {
      if (success == true) {
        emit(const AddDeliveryPrioritySuccess(
            msg: "Add to priority successfuly"));
      } else {
        emit(const AddDeliveryPriorityFailure(
            error: "An error occurred, please try again!"));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'dispatch_pickup_order_state.dart';

class DispatchPickupOrderCubit extends Cubit<DispatchPickupOrderState> {
  DispatchPickupOrderCubit(this.pickupRepo)
      : super(DispatchPickupOrderInitial());

  final PickupRepo pickupRepo;

  Future<void> dispatchPickupOrders(List<String> orderId) async {
    emit(DispatchPickupOrderLoading());
    final result = await pickupRepo.dispatchPickupOrders(orderId);
    result.fold(
      (failure) => emit(DispatchPickupOrderFaliure(error: failure.msg)),
      (success) => emit(
        const DispatchPickupOrderSuccess(
            message: 'Pickup order dispatched successfully'),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'get_pickup_by_id_state.dart';

class GetPickupByIdCubit extends Cubit<GetPickupByIdState> {
  GetPickupByIdCubit(this.pickupRepo) : super(GetPickupByIdInitial());

  final PickupRepo pickupRepo;

  // Future<void> getPendingPickupById(String orderId) async {
  //   emit(GetPickupByIdLoading());
  //   final result = await pickupRepo.getPendingPickupOrdersById(orderId);
  //   result.fold(
  //     (failure) => emit(GetPickupByIdFailure(error: failure.msg)),
  //     (pendingOrder) =>
  //         emit(GetPendingPickupByIdSuccess(pendingOrder: pendingOrder)),
  //   );
  // }

  // Future<void> getPriorityPickupById(String orderId) async {
  //   emit(GetPickupByIdLoading());
  //   final result = await pickupRepo.getPriorityPickupById(orderId);
  //   result.fold(
  //     (failure) => emit(GetPickupByIdFailure(error: failure.msg)),
  //     (priorityPickupOrder) => emit(GetPriorityPickupByIdSuccess(
  //         priorityPickupOrder: priorityPickupOrder)),
  //   );
  // }

  // Future<void> getDispatchPickupById(String orderId) async {
  //   emit(GetPickupByIdLoading());
  //   final result = await pickupRepo.getDispatchPickupById(orderId);
  //   result.fold(
  //     (failure) => emit(GetPickupByIdFailure(error: failure.msg)),
  //     (dispatchPickupOrder) => emit(GetDispatchPickupByIdSuccess(
  //         dispatchPickupOrder: dispatchPickupOrder)),
  //   );
  // }
}

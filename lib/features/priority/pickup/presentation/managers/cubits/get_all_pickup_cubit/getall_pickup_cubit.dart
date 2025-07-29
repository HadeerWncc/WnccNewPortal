import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'getall_pickup_state.dart';

class GetallPickupCubit extends Cubit<GetallPickupState> {
  GetallPickupCubit(this.pickupRepo) : super(GetallPickupInitial());

  final PickupRepo pickupRepo;

  Future<void> getAllPendingPickupOrders() async {
    emit(GetallPickupLoading());
    final result = await pickupRepo.getPendingPickupOrders();
    result.fold(
      (failure) => emit(GetallPickupFailure(errorMessage: failure.msg)),
      (pendingOrders) =>
          emit(GetallPendingPickupSuccess(pendingPickupOrders: pendingOrders)),
    );
  }

  Future<void> getAllPriorityPickupOrders() async {
    emit(GetallPickupLoading());
    final result = await pickupRepo.getPriorityPickupOrders();
    result.fold(
      (failure) => emit(GetallPickupFailure(errorMessage: failure.msg)),
      (priorityOrders) => emit(
          GetallPriorityPickupSuccess(priorityPickupOrders: priorityOrders)),
    );
  }

  Future<void> getAllDispatchPickupOrders(String date) async {
    emit(GetallPickupLoading());
    final result = await pickupRepo.getDispatchPickupByDate(date);
    result.fold(
      (failure) => emit(GetallPickupFailure(errorMessage: failure.msg)),
      (dispatchOrders) => emit(
          GetallDispatchPickupSuccess(dispatchPickupOrders: dispatchOrders)),
    );
  }
}

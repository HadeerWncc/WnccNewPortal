import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'undispatch_pickup_state.dart';

class UndispatchPickupCubit extends Cubit<UndispatchPickupState> {
  UndispatchPickupCubit(this.pickupRepo) : super(UndispatchPickupInitial());

  final PickupRepo pickupRepo;

  Future<void> undispatchPickupOrders(List<String> orderIds) async {
    emit(UndispatchPickupLoading());
    final result = await pickupRepo.undispatchPickupOrders(orderIds);
    result.fold(
      (failure) => emit(UndispatchPickupFailure(error: failure.msg)),
      (success) => emit(
        const UndispatchPickupSuccess(
            message: 'Pickup orders undispatched successfully'),
      ),
    );
  }
}

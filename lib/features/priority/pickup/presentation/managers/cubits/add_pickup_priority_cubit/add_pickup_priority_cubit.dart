import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'add_pickup_priority_state.dart';

class AddPickupPriorityCubit extends Cubit<AddPickupPriorityState> {
  AddPickupPriorityCubit(this.pickupRepo) : super(AddPickupPriorityInitial());

  final PickupRepo pickupRepo;

  Future<void> addPickupPriority(List<String> orderIds) async {
    emit(AddPickupPriorityLoading());
    final result = await pickupRepo.priorityPickupOrder(orderIds);
    result.fold(
      (failure) => emit(AddPickupPriorityFailure(error: failure.msg)),
      (success) => emit(
        const AddPickupPrioritySuccess(
          message: 'Pickup priority added successfully',
        ),
      ),
    );
  }
}

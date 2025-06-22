import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';

part 'delete_pickup_priority_state.dart';

class DeletePickupPriorityCubit extends Cubit<DeletePickupPriorityState> {
  DeletePickupPriorityCubit(this.pickupRepo) : super(DeletePickupPriorityInitial());

  final PickupRepo pickupRepo;

  Future<void> deletePickupPriority(List<String> orderIds) async {
    emit(DeletePickupPriorityLoading());
    final result = await pickupRepo.deletepickupPriority(orderIds);
    result.fold(
      (failure) => emit(DeletePickupPriorityFailure(error: failure.msg)),
      (success) => emit(
        const DeletePickupPrioritySuccess(
          message: 'Pickup priority deleted successfully',
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/repositories/pickup_repo.dart';

part 'get_pickupility_state.dart';

class GetPickupilityCubit extends Cubit<GetPickupilityState> {
  GetPickupilityCubit(this.pickupRepo) : super(GetPickupilityInitial());

  final PickupRepo pickupRepo;

  Future<void> getAllPickup(DateTime date) async {
    emit(GetPickupilityLoading());
    var result = await pickupRepo.getPickUpPriority(date);
    result.fold((error) {
      emit(GetPickupilityFailure(errorMsg: error.msg));
    }, (order) {
      order.sort((a, b) {
        final aIndex = statusOrder[a.status] ?? 999;
        final bIndex = statusOrder[b.status] ?? 999;

        return aIndex.compareTo(bIndex);
      });
      emit(GetPickupilitySuccess(pickupList: order));
    });
  }
}

final statusOrder = {
  "pending": 0,
  "in-process": 1,
  "completed": 2,
  "no-quantity": 3,
};

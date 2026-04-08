import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/repositories/pickup_repo.dart';

part 'get_pickupility_state.dart';

class GetPickupilityCubit extends Cubit<GetPickupilityState> {
  GetPickupilityCubit(this.pickupRepo) : super(GetPickupilityInitial());

  final PickupRepo pickupRepo;

  Future<void> getAllDeliveryPending(DateTime date) async {
    emit(GetPickupilityLoading());
    var result = await pickupRepo.getPickUpPriority(date);
    result.fold((error) {
      emit(GetPickupilityFailure(errorMsg: error.msg));
    }, (order) {
      emit(GetPickupilitySuccess(pickupList: order));
    });
  }
}

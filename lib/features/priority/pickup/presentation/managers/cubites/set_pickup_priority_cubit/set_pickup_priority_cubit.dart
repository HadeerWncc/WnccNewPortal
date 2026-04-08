import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';
import 'package:wncc_portal/features/priority/pickup/domin/repositories/pickup_repo.dart';

part 'set_pickup_priority_state.dart';

class SetPickupPriorityCubit extends Cubit<SetPickupPriorityState> {
  SetPickupPriorityCubit(this.pickupRepo) : super(SetPickupPriorityInitial());
  final PickupRepo pickupRepo;

   Future<void> setPickupPriority(MakePickupilityEntity makePickupility) async {
    emit(SetPickupPriorityLoading());
    var result = await pickupRepo.makePickupility(makePickupility);
    result.fold((msg) {
      emit(SetPickupPriorityFailure(errorMsg: msg.msg));
    }, (msg) {
      emit(SetPickupPrioritySuccess(successMsg: msg));
    });
  }
}

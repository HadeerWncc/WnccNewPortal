import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'get_agents_state.dart';

class GetAgentsCubit extends Cubit<GetAgentsState> {
  GetAgentsCubit(this.deliveryRepo) : super(GetAgentsInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> getAgents() async {
    emit(GetAgentsLoading());
    var result = await deliveryRepo.getDispatchAgents();
    result.fold((error) {
      emit(GetAgentsFailure(error: error.msg));
    }, (agents) {
      emit(GetAgentsSuccess(agents: agents));
    });
  }
}

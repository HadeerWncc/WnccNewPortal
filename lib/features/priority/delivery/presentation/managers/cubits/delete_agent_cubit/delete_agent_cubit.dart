import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'delete_agent_state.dart';

class DeleteAgentCubit extends Cubit<DeleteAgentState> {
  DeleteAgentCubit(this.deliveryRepo) : super(DeleteAgentInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> deleteDispatchers(List<String> dispatchers) async {
    emit(DeleteAgentLoading());
    var result = await deliveryRepo.deleteDispatchers(dispatchers);
    result.fold((error) {
      emit(DeleteAgentFailure(errorMsg: error.msg));
    }, (success) {
      if (success == true) {
        emit(const DeleteAgentSuccess(msg: 'Dispatchers Deleted successfully'));
      } else {
        emit(const DeleteAgentFailure(
            errorMsg: 'An error occurred, please try again!'));
      }
    });
  }
}

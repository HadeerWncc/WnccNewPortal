import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'edit_dispatcher_name_state.dart';

class EditDispatcherNameCubit extends Cubit<EditDispatcherNameState> {
  EditDispatcherNameCubit(this.deliveryRepo)
      : super(EditDispatcherNameInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> editDispatcherName(String id, String name) async {
    emit(EditDispatcherNameLoading());
    var result = await deliveryRepo.editDispatcher(id, name);
    result.fold((error) {
      emit(EditDispatcherNameFailure(errorMsg: error.msg));
    }, (success) {
      if (success == true) {
        emit(const EditDispatcherNameSuccess(
            msg: 'Dispatcher updated successfully'));
      } else {
        emit(const EditDispatcherNameFailure(
            errorMsg: 'An error occurred, please try again!'));
      }
    });
  }
}

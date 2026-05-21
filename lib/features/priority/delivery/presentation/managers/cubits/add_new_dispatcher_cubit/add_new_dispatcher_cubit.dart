import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';

part 'add_new_dispatcher_state.dart';

class AddNewDispatcherCubit extends Cubit<AddNewDispatcherState> {
  AddNewDispatcherCubit(this.deliveryRepo) : super(AddNewDispatcherInitial());

  final DeliveryRepo deliveryRepo;

  Future<void> addNewDispatcher(String name) async {
    emit(AddNewDispatcherLoading());
    var result = await deliveryRepo.addNewDispatcher(name);
    result.fold((error) {
      emit(AddNewDispatcherFailure(error: error.msg));
    }, (success) {
      if (success == true) {
        emit(const AddNewDispatcherSuccess(msg: 'Dispatcher Added successfully'));
      } else {
        emit(const AddNewDispatcherFailure(
            error: 'An error occurred, please try again!'));
      }
    });
  }
}

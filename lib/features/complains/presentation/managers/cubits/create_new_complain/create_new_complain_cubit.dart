import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/complains/domain/entities/create_complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';

part 'create_new_complain_state.dart';

class CreateNewComplainCubit extends Cubit<CreateNewComplainState> {
  CreateNewComplainCubit(this.complainRepo) : super(CreateNewComplainInitial());

  final ComplainRepo complainRepo;

  Future createNewComplain(CreateComplainEntity createComplainEntity) async {
    emit(CreateNewComplainLoading());
    var result = await complainRepo.createNewComplain(createComplainEntity);
    result.fold((error) {
      emit(CreateNewComplainFailure(error: error.msg));
    }, (msg) {
      emit(CreateNewComplainSuccess(msg: msg));
    });
  }

  Future editComplain(CreateComplainEntity createComplainEntity) async {
    emit(CreateNewComplainLoading());
    var result = await complainRepo.editComplain(createComplainEntity);
    result.fold((error) {
      emit(CreateNewComplainFailure(error: error.msg));
    }, (msg) {
      emit(CreateNewComplainSuccess(msg: msg));
    });
  }
}

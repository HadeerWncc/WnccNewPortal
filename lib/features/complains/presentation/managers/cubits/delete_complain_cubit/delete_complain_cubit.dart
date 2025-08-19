import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';

part 'delete_complain_state.dart';

class DeleteComplainCubit extends Cubit<DeleteComplainState> {
  DeleteComplainCubit(this.complainRepo) : super(DeleteComplainInitial());

  final ComplainRepo complainRepo;

  Future removeComplain(String complainId) async {
    emit(DeleteComplainloading());
    var result = await complainRepo.deleteComplain(complainId);
    result.fold((error) {
      emit(DeleteComplainFailure(error: error.msg));
    }, (msg) {
      emit(const DeleteComplainSuccess(msg: "Complain removed successfuly!"));
    });
  }
}

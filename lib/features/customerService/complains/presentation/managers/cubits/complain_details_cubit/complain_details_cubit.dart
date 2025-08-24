import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/customerService/complains/domain/repos/complain_repo.dart';

part 'complain_details_state.dart';

class ComplainDetailsCubit extends Cubit<ComplainDetailsState> {
  ComplainDetailsCubit(this.complainRepo) : super(ComplainDetailsInitial());

  final ComplainRepo complainRepo;

  Future getComplainById(String complainId) async {
    emit(ComplainDetailsLoading());
    var result = await complainRepo.getComplainById(complainId);
    result.fold((error) {
      emit(ComplainDetailsFailure(error: error.msg));
    }, (complain) {
      emit(ComplainDetailsSuccess(complain: complain));
    });
  }

  Future openComplain(String complainId) async {
    emit(ComplainDetailsLoading());
    var result = await complainRepo.openComplain(complainId);
    result.fold((error) {
      emit(ComplainDetailsFailure(error: error.msg));
    }, (complain) {
      emit(ComplainDetailsSuccess(complain: complain));
    });
  }
}

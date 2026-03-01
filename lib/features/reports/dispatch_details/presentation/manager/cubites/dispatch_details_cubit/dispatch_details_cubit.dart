import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'dispatch_details_state.dart';

class DispatchDetailsCubit extends Cubit<DispatchDetailsState> {
  DispatchDetailsCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getDispatchDetails(DateTime date) async {
    emit(DispatchDetailsLoading());
    var result = await dispatchDetailsRepo.getDispatchDetails(date);
    result.fold((error) {
      emit(DispatchDetailsFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(DispatchDetailsSuccess(dispatchDetailsList: dispatchDetailsList));
    });
  }
}

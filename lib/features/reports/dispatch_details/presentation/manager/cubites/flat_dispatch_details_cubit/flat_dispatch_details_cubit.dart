import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_flat_data_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'flat_dispatch_details_state.dart';

class FlatDispatchDetailsCubit extends Cubit<FlatDispatchDetailsState> {
  FlatDispatchDetailsCubit(this.dispatchDetailsRepo)
      : super(FlatDispatchDetailsInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getFlatDispatchDetails(DateTime date) async {
    emit(FlatDispatchDetailsLoading());
    var result = await dispatchDetailsRepo.getDispatchDetailsFlatData(date);
    result.fold((error) {
      emit(FlatDispatchDetailsFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(FlatDispatchDetailsSuccess(dispatchDetails: dispatchDetailsList));
    });
  }
}

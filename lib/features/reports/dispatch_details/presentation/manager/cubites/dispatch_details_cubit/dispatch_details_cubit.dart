import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';

part 'dispatch_details_state.dart';

class DispatchDetailsCubit extends Cubit<DispatchDetailsState> {
  DispatchDetailsCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getDispatchDetailsPerRegion(DateTime date) async {
    emit(DispatchDetailsLoading());
    var result = await dispatchDetailsRepo.getDispatchDetails(date, 0);
    result.fold((error) {
      emit(DispatchDetailsFailure(error: error.msg));
    }, (dispatchDetailsList) {
      dispatchDetailsList =
          dispatchDetailsList.where((d) => d.monthDays!.isNotEmpty).toList();
      emit(DispatchDetailsSuccess(dispatchDetailsList: dispatchDetailsList));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/repo/dispatch_details_vs_repo.dart';

part 'dispatch_detasils_v2_per_region_state.dart';

class DispatchDetasilsV2PerRegionCubit
    extends Cubit<DispatchDetasilsV2PerRegionState> {
  DispatchDetasilsV2PerRegionCubit(this.dispatchDetailsRepo)
      : super(DispatchDetasilsV2PerRegionInitial());
  final DispatchDetailsVsRepo dispatchDetailsRepo;

  Future getDispatchDetailsV2PerRegion(DateTime date, int zone) async {
    emit(DispatchDetasilsV2PerRegionLoading());
    var result =
        await dispatchDetailsRepo.getDispatchDetailsPerRegion(date, zone);
    result.fold((error) {
      emit(DispatchDetasilsV2PerRegionFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(DispatchDetasilsV2PerRegionSuccess(
          dispatchDetails: dispatchDetailsList));
    });
  }
}

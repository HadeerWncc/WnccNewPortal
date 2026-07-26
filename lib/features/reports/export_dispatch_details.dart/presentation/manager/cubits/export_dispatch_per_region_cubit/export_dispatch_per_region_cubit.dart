import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/domain/repo/export_dispatch_repo.dart';

part 'export_dispatch_per_region_state.dart';

class ExportDispatchPerRegionCubit extends Cubit<ExportDispatchPerRegionState> {
  ExportDispatchPerRegionCubit(this.exportDispatchRepo)
      : super(ExportDispatchPerRegionInitial());
  final ExportDispatchRepo exportDispatchRepo;
  Future getExportDispatchPerRegion(DateTime date, int mode) async {
    emit(ExportDispatchPerRegionLoading());
    var result =
        await exportDispatchRepo.getExportDispatchDetails(date, mode, 0);
    result.fold((error) {
      emit(ExportDispatchPerRegionFailure(error: error.msg));
    }, (exportDispatchList) {
      emit(ExportDispatchPerRegionSuccess(
          expDisDetailsPerRegion: exportDispatchList));
    });
  }
}

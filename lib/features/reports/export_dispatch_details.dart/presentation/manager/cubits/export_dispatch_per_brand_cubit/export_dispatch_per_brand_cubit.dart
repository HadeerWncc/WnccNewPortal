import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/domain/repo/export_dispatch_repo.dart';

part 'export_dispatch_per_brand_state.dart';

class ExportDispatchPerBrandCubit extends Cubit<ExportDispatchPerBrandState> {
  ExportDispatchPerBrandCubit(this.exportDispatchRepo)
      : super(ExportDispatchPerBrandInitial());
  final ExportDispatchRepo exportDispatchRepo;
  Future getExportDispatchPerBrand(DateTime date, int mode) async {
    emit(ExportDispatchPerBrandLoading());
    var result =
        await exportDispatchRepo.getExportDispatchDetails(date, mode, 3);
    result.fold((error) {
      emit(ExportDispatchPerBrandFailure(error: error.msg));
    }, (exportDispatchList) {
      emit(ExportDispatchPerBrandSuccess(expDisPerBrand: exportDispatchList));
    });
  }
}

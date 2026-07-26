import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/domain/repo/export_dispatch_repo.dart';

part 'export_dispatch_per_customer_state.dart';

class ExportDispatchPerCustomerCubit
    extends Cubit<ExportDispatchPerCustomerState> {
  ExportDispatchPerCustomerCubit(this.exportDispatchRepo)
      : super(ExportDispatchPerCustomerInitial());
  final ExportDispatchRepo exportDispatchRepo;
  Future getExportDispatchPerCustomer(DateTime date, int mode) async {
    emit(ExportDispatchPerCustomerLoading());
    var result =
        await exportDispatchRepo.getExportDispatchDetails(date, mode, 2);
    result.fold((error) {
      emit(ExportDispatchPerCustomerFailure(error: error.msg));
    }, (exportDispatchList) {
      emit(ExportDispatchPerCustomerSuccess(
          exportDispatchList: exportDispatchList));
    });
  }
}

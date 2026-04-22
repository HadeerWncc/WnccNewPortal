import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'dispatch_details_per_sales_state.dart';

class DispatchDetailsPerSalesCubit extends Cubit<DispatchDetailsPerSalesState> {
  DispatchDetailsPerSalesCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsPerSalesInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getDispatchDetailsPerSales(DateTime fromDate, DateTime toDate) async {
    emit(DispatchDetailsPerSalesLoading());
    var result =
        await dispatchDetailsRepo.getDispatchDetailsPerSales(fromDate, toDate);
    result.fold((error) {
      emit(DispatchDetailsPerSalesFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(
          DispatchDetailsPerSalesSuccess(dispatchDetails: dispatchDetailsList));
    });
  }
}

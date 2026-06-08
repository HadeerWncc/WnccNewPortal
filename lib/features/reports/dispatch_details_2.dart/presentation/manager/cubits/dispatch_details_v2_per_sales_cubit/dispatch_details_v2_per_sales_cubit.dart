import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/repo/dispatch_details_vs_repo.dart';

part 'dispatch_details_v2_per_sales_state.dart';

class DispatchDetailsV2PerSalesCubit extends Cubit<DispatchDetailsV2PerSalesState> {
  DispatchDetailsV2PerSalesCubit(this.dispatchDetailsRepo) : super(DispatchDetailsV2PerSalesInitial());

  final DispatchDetailsVsRepo dispatchDetailsRepo;

  Future getDispatchDetailsV2PerSales(DateTime date, int zone) async {
    emit(DispatchDetailsV2PerSalesLoading());
    var result = await dispatchDetailsRepo.getDispatchDetailsPerSales(date, zone);
    result.fold((error) {
      emit(DispatchDetailsV2PerSalesFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(
          DispatchDetailsV2PerSalesSuccess(dispatchDetails: dispatchDetailsList));
    });
  }
}

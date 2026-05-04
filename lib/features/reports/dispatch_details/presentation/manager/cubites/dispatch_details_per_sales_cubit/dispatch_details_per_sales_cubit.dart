import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'dispatch_details_per_sales_state.dart';

class DispatchDetailsPerSalesCubit extends Cubit<DispatchDetailsPerSalesState> {
  DispatchDetailsPerSalesCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsPerSalesInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getDispatchDetailsPerSales(DateTime date) async {
    emit(DispatchDetailsPerSalesLoading());
    var result = await dispatchDetailsRepo.getDispatchDetails(date, 1);
    result.fold((error) {
      emit(DispatchDetailsPerSalesFailure(error: error.msg));
    }, (dispatchDetailsList) {
      dispatchDetailsList = dispatchDetailsList.where((d)=>d.monthDays!.isNotEmpty).toList();
      emit(
          DispatchDetailsPerSalesSuccess(dispatchDetails: dispatchDetailsList));
    });
  }
}

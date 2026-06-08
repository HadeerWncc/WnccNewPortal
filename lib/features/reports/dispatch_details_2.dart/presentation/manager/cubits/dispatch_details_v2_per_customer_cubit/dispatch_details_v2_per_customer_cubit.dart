import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/repo/dispatch_details_vs_repo.dart';

part 'dispatch_details_v2_per_customer_state.dart';

class DispatchDetailsV2PerCustomerCubit
    extends Cubit<DispatchDetailsV2PerCustomerState> {
  DispatchDetailsV2PerCustomerCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsV2PerCustomerInitial());
  final DispatchDetailsVsRepo dispatchDetailsRepo;

  Future getDispatchDetailsV2PerCustomer(DateTime date, int zone) async {
    emit(DispatchDetailsV2PerCustomerLoading());
    var result =
        await dispatchDetailsRepo.getDispatchDetailsPerCustomer(date, zone);
    result.fold((error) {
      emit(DispatchDetailsV2PerCustomerFailure(error: error.msg));
    }, (dispatchDetailsList) {
      emit(DispatchDetailsV2PerCustomerSuccess(
          dispatchDetails: dispatchDetailsList));
    });
  }
}

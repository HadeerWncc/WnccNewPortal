import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'dispatch_details_per_customer_state.dart';

class DispatchDetailsPerCustomerCubit
    extends Cubit<DispatchDetailsPerCustomerState> {
  DispatchDetailsPerCustomerCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsPerCustomerInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;

  Future getDispatchDetailsPerCustomer(DateTime date) async {
    emit(DispatchDetailsPerCustomerLoading());
    var result = await dispatchDetailsRepo.getDispatchDetails(date, 2);
    result.fold((error) {
      emit(DispatchDetailsPerCustomerFailure(error: error.msg));
    }, (dispatchDetailsList) {
      dispatchDetailsList =
          dispatchDetailsList.where((d) => d.monthDays!.isNotEmpty).toList();
      emit(DispatchDetailsPerCustomerSuccess(
          dispatchDetails: dispatchDetailsList));
    });
  }
}

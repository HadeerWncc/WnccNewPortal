import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_compare_model/Fact_vs_cust_disp_compare.dart';
import 'package:wncc_portal/features/factVsCustDisp/domain/repos/fact_vs_cust_repo.dart';

part 'fact_vs_cust_compare_state.dart';

class FactVsCustCompareCubit extends Cubit<FactVsCustCompareState> {
  FactVsCustCompareCubit(this.factVsCustRepo) : super(FactVsCustCompareInitial());
  
  final FactVsCustRepo factVsCustRepo;

  Future getFactVsCustDisp(int mode, DateTime date) async {
    emit(FactVsCustCompareLoading());
    var result = await factVsCustRepo.getFactVsCustDispCompare(date);
    result.fold((error) {
      emit(FactVsCustCompareFailure(errorMessage: error.msg));
    }, (factVsCustList) {
      emit(FactVsCustCompareSuccess(factVsCustDispCompareList: factVsCustList));
    });
  }
}

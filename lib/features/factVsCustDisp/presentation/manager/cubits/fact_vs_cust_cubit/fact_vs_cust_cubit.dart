import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';
import 'package:wncc_portal/features/factVsCustDisp/domain/repos/fact_vs_cust_repo.dart';

part 'fact_vs_cust_state.dart';

class FactVsCustCubit extends Cubit<FactVsCubitState> {
  FactVsCustCubit(this.factVsCustRepo) : super(FactVsCustCubitInitial());

  final FactVsCustRepo factVsCustRepo;

  Future getFactVsCustDisp(int mode, DateTime date) async {
    emit(FactVsCustCubitLoading());
    var result = await factVsCustRepo.getFactVsCustDisp(mode, date);
    result.fold((error) {
      emit(FactVsCustCubitFailure(error: error.msg));
    }, (factVsCustList) {
      emit(FactVsCustCubitSuccess(factVsCustList: factVsCustList));
    });
  }
}

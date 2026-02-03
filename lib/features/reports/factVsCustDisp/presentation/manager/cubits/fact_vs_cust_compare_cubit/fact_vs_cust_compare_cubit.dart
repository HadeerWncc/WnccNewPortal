import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/compareing_entity.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/repos/fact_vs_cust_repo.dart';

part 'fact_vs_cust_compare_state.dart';

class FactVsCustCompareCubit extends Cubit<FactVsCustCompareState> {
  FactVsCustCompareCubit(this.factVsCustRepo)
      : super(FactVsCustCompareInitial());

  final FactVsCustRepo factVsCustRepo;

  Future getFactVsCustDispCompare(
      DateTime selectedDate, DateTime compareDate) async {
    emit(FactVsCustCompareLoading());
    var result = await factVsCustRepo.getFactVsCustDispCompare(
        selectedDate, compareDate);
    result.fold((error) {
      emit(FactVsCustCompareFailure(errorMessage: error.msg));
    }, (compareModel) {
      CompareingEntity compareEntity = CompareingEntity(
        compareYear: compareModel.compare!
            .map((e) => ComparingEntityItem(
                  year: compareDate.year,
                  month: e.month!,
                  bags: e.customerDispatchResponse!.totalBags ?? 0.0,
                  bulk: e.customerDispatchResponse!.bulk ?? 0.0,
                  export: e.customerDispatchResponse!.totalExport ?? 0.0,
                  clincker: e.customerDispatchResponse!.clinker ?? 0.0,
                ))
            .toList(),
        selectedYear: compareModel.selected!
            .map((e) => ComparingEntityItem(
                  year: selectedDate.year,
                  month: e.month!,
                  bags: e.customerDispatchResponse!.totalBags ?? 0.0,
                  bulk: e.customerDispatchResponse!.bulk ?? 0.0,
                  export: e.customerDispatchResponse!.totalExport ?? 0.0,
                  clincker: e.customerDispatchResponse!.clinker ?? 0.0,
                ))
            .toList(),
        difference: compareModel.difference!
            .map((e) => ComparingEntityItem(
                  year: 0,
                  month: e.month!,
                  bags: e.customerDispatchResponse!.totalBags ?? 0.0,
                  bulk: e.customerDispatchResponse!.bulk ?? 0.0,
                  export: e.customerDispatchResponse!.totalExport ?? 0.0,
                  clincker: e.customerDispatchResponse!.clinker ?? 0.0,
                ))
            .toList(),
      );
      emit(FactVsCustCompareSuccess(factVsCustDispCompare: compareEntity));
    });
  }
}

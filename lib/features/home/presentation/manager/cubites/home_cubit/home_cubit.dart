import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/sales_datum.dart';
import 'package:wncc_portal/features/home/domain/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  List<String> _selectedSales = [];
  List<SalesDatum> _allData = [];
  List<String> _mainSales = [];
  Future<void> getHomeSummary(
      DateTime fromDate, DateTime toDate, String? code) async {
    emit(HomeLoading());
    final result = await homeRepo.getHomeSummary(fromDate, toDate, code);
    result.fold((failure) => emit(HomeFailure(errorMessage: failure.msg)),
        (data) {
      _mainSales = data.salesData!.map((s) => s.salesName ?? "").toList();
      _allData = data.salesData ?? [];
      _applyFilters();
    }
        // emit(HomeSuccess(homeSummary: data)),
        );
  }

  void _applyFilters() {
    emit(HomeLoading());
    if (_selectedSales.isNotEmpty) {
      List<SalesDatum> filteredData =
          _allData.where((e) => _selectedSales.contains(e.salesName)).toList();
      emit(HomeSuccess(homeSummary: filteredData, _mainSales));
    } else {
      emit(HomeSuccess(homeSummary: _allData, _mainSales));
    }
  }

  void selectSales(List<String> value) {
    _selectedSales = value;
    _applyFilters();
  }
}

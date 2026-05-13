import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/entities/loading_details_summary_entity.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/repos/loading_repo.dart';

part 'loading_details_state.dart';

class LoadingDetailsCubit extends Cubit<LoadingDetailsState> {
  LoadingDetailsCubit(this.loadingRepo) : super(LoadingDetailsInitial());

  final LoadingRepo loadingRepo;

  /// 🔹 Master Data
  List<LoadingDetailsModel> _allData = [];

  /// 🔹 Filters state
  String _search = "";
  String _sales = "All";
  String _product = "All";
  int _activeTab = 2;

  /// ✅ Public getter للوصول للـ allData من UI
  List<LoadingDetailsModel> get allData => _allData;

  // =========================================================
  // 🚀 API
  // =========================================================

  Future getLoadingDetails() async {
    emit(LoadingDetailsLoading());

    final result = await loadingRepo.getLoadingDetails();

    result.fold(
      (error) => emit(LoadingDetailsFailure(errorMsg: error.msg)),
      (data) {
        _allData = data;
        _applyFilters(); // فلترة مباشرة بعد التحميل
      },
    );
  }

  // =========================================================
  // 🚀 Summary calculation
  // =========================================================

  LoadingDetailsSummaryEntity _calculateSummary(
      List<LoadingDetailsModel> loadingDetails) {
    num wadi = 0;
    num masry = 0;
    num bulk = 0;
    num export = 0;

    for (var l in loadingDetails) {
      if (l.materialId == 'F-BU01') {
        bulk += l.deliveryQuantity ?? 0;
      } else if (l.materialId == 'F-BA01') {
        masry += l.deliveryQuantity ?? 0;
      } else if (l.materialId == 'F-BA02') {
        wadi += l.deliveryQuantity ?? 0;
      }
      if (l.distributionChannel == 'Export') {
        export += l.deliveryQuantity ?? 0;
      }
    }

    final total = wadi + masry + bulk + export;

    return LoadingDetailsSummaryEntity(
      bulk: bulk,
      masry: masry,
      export: export,
      total: total,
      wadie: wadi,
    );
  }

  // =========================================================
  // 🚀 Filtering Core
  // =========================================================

  void _applyFilters() {
    emit(LoadingDetailsLoading());

    final filtered = _allData.where((t) {
      final matchDoc = _search.isEmpty ||
          (t.shipmentNo ?? "").toLowerCase().contains(_search.toLowerCase());

      final matchSales = _sales == "All" || t.salesName == _sales;

      final matchProduct = _product == "All" || t.materialName == _product;

      final matchTab = switch (_activeTab) {
        0 => t.loadStartDate == null, // Check In
        1 => t.loadStartDate != null, // Loading
        _ => true, // Both
      };

      return matchDoc && matchSales && matchProduct && matchTab;
    }).toList();

    final summary = _calculateSummary(filtered);
    emit(
      LoadingDetailsSuccess(
        loadingDetails: filtered,
        activeTab: _activeTab,
        summary: summary,
      ),
    );
  }

  // =========================================================
  // 🚀 UI Actions
  // =========================================================

  void search(String value) {
    _search = value;
    _applyFilters();
  }

  void changeSales(String value) {
    _sales = value;
    _applyFilters();
  }

  void changeProduct(String value) {
    _product = value;
    _applyFilters();
  }

  void changeTab(int tab) {
    _activeTab = tab;
    _applyFilters();
  }

  /// اختياري لإعادة كل الفلاتر للوضع الإفتراضي
  void resetFilters() {
    _search = "";
    _sales = "All";
    _product = "All";
    _activeTab = 2;
    _applyFilters();
  }
}

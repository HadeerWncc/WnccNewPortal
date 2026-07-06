import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_details_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_value_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatches_region_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/month_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/total_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/value_data_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/repo/dispatch_details_vs_repo.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_total_dispatch.dart';

part 'dispatch_details_v2_per_customer_state.dart';

class DispatchDetailsV2PerCustomerCubit
    extends Cubit<DispatchDetailsV2PerCustomerState> {
  DispatchDetailsV2PerCustomerCubit(this.dispatchDetailsRepo)
      : super(DispatchDetailsV2PerCustomerInitial());
  final DispatchDetailsVsRepo dispatchDetailsRepo;
  int selectedView = 0;
  String _selectedChnl = 'Both';
  List<String> _selectedincoterm = [];
  List<String> _selectedType = [];
  List<DispatchDetailsVsModel> _allData = [];
  List<DispatchDetailsEntity> dispatchDetailsList = [];
  UserModel? currentUser;
  Future getDispatchDetailsV2PerCustomer(
      DateTime date, int zone, UserModel user) async {
    currentUser = user;
    emit(DispatchDetailsV2PerCustomerLoading());
    var result =
        await dispatchDetailsRepo.getDispatchDetailsPerCustomer(date, zone);
    result.fold((error) {
      emit(DispatchDetailsV2PerCustomerFailure(error: error.msg));
    }, (dispatchDetailsList) {
      _allData = dispatchDetailsList;
      _applyFilters(currentUser!);
    });
  }

  void _applyFilters(UserModel user) {
    emit(DispatchDetailsV2PerCustomerLoading());
    int index = 1;
    List<DispatchDetailsVsModel> filteredData = List.from(_allData);
    if (_selectedChnl != 'Both') {
      filteredData = _allData
          .where((d) => d.distributionChannelType == _selectedChnl)
          .toList();
    }
    filteredData.sort(
      (a, b) => getDisSortValue(
        b.total!.value!,
        _selectedincoterm,
        _selectedType,
      ).compareTo(
        getDisSortValue(
          a.total!.value!,
          _selectedincoterm,
          _selectedType,
        ),
      ),
    );
    DispatchDetailsVsModel totalDis = getTotalDis(filteredData);
    if (user.position?.contains('Sales') ?? false) {
      List<DispatchDetailsVsModel> disOfSales = filteredData
          .where((d) =>
              [...user.subordinates!, user.profileId].contains(d.salesId))
          .toList();
      totalDis = getTotalDis(disOfSales);
    }
    filteredData.add(totalDis);
    dispatchDetailsList.clear();
    for (var item in filteredData) {
      DispatchDetailsEntity dispatchDetailsItem = DispatchDetailsEntity(
        id: item.id ?? '',
        name: item.name ?? '',
        salesName: item.salesName,
        salesId: item.salesId ?? '',
        distributionChannelType: item.distributionChannelType ?? '',
        total: TotalEntity(
            value: getDisValue(
              item.total!.value!,
              _selectedincoterm,
              _selectedType,
            ),
            dispatches: item.total!.dispatches!.map((d) {
              return DispatchEntity(
                id: d.id ?? '',
                name: d.name ?? '',
                value: getDisValue(d.value!, _selectedincoterm, _selectedType),
              );
            }).toList()),
        totalToday: TotalEntity(
            value: getDisValue(
                item.totalToday!.value!, _selectedincoterm, _selectedType),
            dispatches: item.totalToday!.dispatches!.map((d) {
              return DispatchEntity(
                id: d.id ?? '',
                name: d.name ?? '',
                value: getDisValue(d.value!, _selectedincoterm, _selectedType),
              );
            }).toList()),
        totalCheckedIn:
            getDisValue(item.totalCheckedIn!, _selectedincoterm, _selectedType),
        totalLoading:
            getDisValue(item.totalLoading!, _selectedincoterm, _selectedType),
        months: item.months!.map((m) {
          return MonthEntity(
            name: m.name ?? '',
            date: m.date ?? '',
            totalEntity: TotalEntity(
              value: getDisValue(
                m.value!.value!,
                _selectedincoterm,
                _selectedType,
              ),
              dispatches: m.value!.dispatches!.map((d) {
                return DispatchEntity(
                  id: d.id ?? '',
                  name: d.name ?? '',
                  value: getDisValue(
                    d.value!,
                    _selectedincoterm,
                    _selectedType,
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
        values: item.values!.map((v) {
          return ValueDataEntity(
              date: v.date ?? 0,
              dispatches: v.dispatches!.map((vd) {
                return DispatchValueEntity(
                    name: vd.name ?? '',
                    value: TotalEntity(
                        value: getDisValue(
                          vd.value!.value!,
                          _selectedincoterm,
                          _selectedType,
                        ),
                        dispatches: vd.value!.dispatches!.map((dd) {
                          return DispatchEntity(
                            id: dd.id ?? '',
                            name: dd.name ?? '',
                            value: getDisValue(
                              dd.value!,
                              _selectedincoterm,
                              _selectedType,
                            ),
                          );
                        }).toList()));
              }).toList());
        }).toList(),
        dispatches: item.dispatches!.map((id) {
          return DispatchesRegionEntity(
              id: id.id ?? '',
              name: id.name ?? '',
              dispatches: id.dispatches!.map((rd) {
                return DispatchValueEntity(
                  name: rd.name ?? '',
                  value: TotalEntity(
                    value: getDisValue(
                      rd.value!.value!,
                      _selectedincoterm,
                      _selectedType,
                    ),
                    dispatches: rd.value!.dispatches!.map((dvd) {
                      return DispatchEntity(
                        id: dvd.id ?? '',
                        name: dvd.name ?? '',
                        value: getDisValue(
                          dvd.value!,
                          _selectedincoterm,
                          _selectedType,
                        ),
                      );
                    }).toList(),
                  ),
                );
              }).toList());
        }).toList(),
        rank: item.id == 'Total' ? '' : '${index++}',
      );
      dispatchDetailsList.add(dispatchDetailsItem);
    }

    if (user.position!.contains('Sales')) {
      dispatchDetailsList = dispatchDetailsList
          .where((d) =>
              [...user.subordinates!, user.profileId].contains(d.salesId) ||
              d.salesId == "")
          .toList();
    }
    emit(DispatchDetailsV2PerCustomerSuccess(
        dispatchDetails: dispatchDetailsList));
  }

  void changeincoterm(List<String> value) {
    _selectedincoterm = value;
    if (currentUser == null) return;
    _applyFilters(currentUser!);
  }

  void changeType(List<String> value) {
    _selectedType = value;
    if (currentUser == null) return;
    _applyFilters(currentUser!);
  }

  void changeDisChnl(String disChl) {
    _selectedChnl = disChl;
    if (currentUser == null) return;
    _applyFilters(currentUser!);
  }
}

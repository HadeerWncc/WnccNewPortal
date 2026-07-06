import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/region_with_area.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_cubit/dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_month_data_per_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_region_top_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/loading_widgets/loading_dispatch_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class DispatchPerRegionTablesBody extends StatefulWidget {
  const DispatchPerRegionTablesBody({super.key});

  @override
  State<DispatchPerRegionTablesBody> createState() =>
      _DispatchPerRegionTablesBodyState();
}

class _DispatchPerRegionTablesBodyState
    extends State<DispatchPerRegionTablesBody> {
  late LinkedScrollControllerGroup _horizontalControllers;
  late ScrollController _headerController;
  late ScrollController _bodyController;

  final Map<int, bool> _expandedMonths = {};

  static const double dateWidth = 150.0;
  static const double cellWidth = 100.0;
  List<RegionWithArea> allRegions = [];
  List<String> regions = [];
  List<DataValue> dataValue = [];
  List<String> quantityType = [];
  List<String> quantityMatrial = [];
  int activeTabType = 2;
  int activeTabMatrial = 2;
  @override
  void initState() {
    super.initState();
    _horizontalControllers = LinkedScrollControllerGroup();
    _headerController = _horizontalControllers.addAndGet();
    _bodyController = _horizontalControllers.addAndGet();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  BoxBorder totalBorder = const Border.symmetric(
      horizontal:
          BorderSide(color: Color.fromARGB(255, 45, 83, 33), width: .5));

  @override
  Widget build(BuildContext context) {
    double scrollableWidth = (6 * cellWidth) + (regions.length * cellWidth);
    return Expanded(
      child: Column(
        children: [
          DispatchDetailsHeader(
            group: 0,
            selectedItems: regions,
            onChanged: (values, dataValues) {
              regions = values;
              dataValue = dataValues;
              setState(() {});
            },
          ),
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: CustomMultiSelectDropDown2(
                    products: const ["Delivery", "Pickup"],
                    selectedProducts: quantityType,
                    onChanged: (value) {
                      setState(() {
                        quantityType = value;
                      });
                      // cubit.changeincoterm(value);
                    },
                    title: "Incoterm",
                  )),
              const SizedBox(height: 5),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: CustomMultiSelectDropDown2(
                    products: const ["Bags", "Bulk"],
                    selectedProducts: quantityMatrial,
                    onChanged: (value) {
                      setState(() {
                        quantityMatrial = value;
                      });
                      // cubit.changeType(value);
                    },
                    title: "Type",
                  ))
            ],
          ),
          const SizedBox(height: 8),
          sectionTitle('Dispatch Details (Per Region)'),
          const SizedBox(height: 5),
          BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
            builder: (context, state) {
              if (state is DispatchDetailsSuccess) {
                return buildRegionTopHeader(
                    state.dispatchDetailsList[0].monthDays?[0].dataValues ?? [],
                    regions,
                    _headerController);
              } else {
                return buildRegionTopHeader([], [], _headerController);
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
                builder: (context, state) {
                  if (state is DispatchDetailsSuccess) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFixedSideColumn(state.dispatchDetailsList),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _bodyController,
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: scrollableWidth,
                              child: Column(children: [
                                ...List.generate(
                                    state.dispatchDetailsList.length, (index) {
                                  return buildMonthDataPerRegion(
                                    state.dispatchDetailsList[index],
                                    index,
                                    regions,
                                    totalBorder,
                                    _expandedMonths,
                                    ['Pickup'],
                                    ['Bags'],
                                  );
                                }),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is DispatchDetailsFailure) {
                    return Center(
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    );
                  }
                  return const LoadingDispatchTable();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFixedSideColumn(
      List<DispatchDetailsPerRegionModel> dispatchDetailsResponse) {
    return Column(children: [
      ...List.generate(dispatchDetailsResponse.length, (index) {
        final month = dispatchDetailsResponse[index];
        final isExpanded = _expandedMonths[index] ?? false;

        return Column(
          children: [
            GestureDetector(
              onTap: () => setState(() => _expandedMonths[index] = !isExpanded),
              child: buildCell(
                "${isExpanded ? '▼' : '▶'} Total Dispatch (${DateFormat('MMM').format(DateTime.parse(month.monthDate!))})",
                width: dateWidth,
                isHeader: true,
                color: const Color(0xFFf3f3f3),
                border: totalBorder,
              ),
            ),
            if (isExpanded)
              ...(month.monthDays?.map(
                    (day) => buildCell(
                      DateFormat("d/M/yyyy").format(DateTime.parse(day.date!)),
                      width: dateWidth,
                      color: const Color(0xFFf3f3f3),
                    ),
                  ) ??
                  []),
          ],
        );
      }),
    ]);
  }
}

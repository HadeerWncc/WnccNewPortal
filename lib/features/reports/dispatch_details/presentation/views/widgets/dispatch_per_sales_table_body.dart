import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_sales_cubit/dispatch_details_per_sales_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_month_data_per_sales.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_sales_top_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/loading_widgets/loading_dispatch_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';

class DispatchPerSalesTableBody extends StatefulWidget {
  const DispatchPerSalesTableBody({super.key});
  @override
  State<DispatchPerSalesTableBody> createState() =>
      _DispatchPerSalesTableBodyState();
}

class _DispatchPerSalesTableBodyState extends State<DispatchPerSalesTableBody> {
  late LinkedScrollControllerGroup _horizontalControllers;
  late ScrollController _headerController;
  late ScrollController _bodyController;

  final Map<int, bool> _expandedMonths = {};

  static const double dateWidth = 150.0;
  static const double cellWidth = 100.0;
  List<String> sales = [];
  List<DataValue> dataValue = [];
  QuantityType quantityType = QuantityType.total;
  QuantityMatrial quantityMatrial = QuantityMatrial.total;
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
    return Expanded(
      child: Column(
        children: [
          DispatchDetailsHeader(
            group: 1,
            selectedItems: sales,
            onChanged: (values, dataValues) {
              sales = values;
              dataValue = dataValues;
              setState(() {});
            },
          ),
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomChckButtons(
                buttons: const ["Delivery", "Pickup", "Both"],
                activeTab: activeTabType,
                onTap: (value) {
                  if (value == "Delivery") {
                    activeTabType = 0;
                    quantityType = QuantityType.delivery;
                  } else if (value == "Pickup") {
                    activeTabType = 1;
                    quantityType = QuantityType.pickup;
                  } else {
                    activeTabType = 2;
                    quantityType = QuantityType.total;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 5),
              CustomChckButtons(
                buttons: const ["Bags", "Bulk", "Both"],
                activeTab: activeTabMatrial,
                onTap: (value) {
                  if (value == "Bags") {
                    activeTabMatrial = 0;
                    quantityMatrial = QuantityMatrial.bags;
                  } else if (value == "Bulk") {
                    activeTabMatrial = 1;
                    quantityMatrial = QuantityMatrial.bulk;
                  } else {
                    activeTabMatrial = 2;
                    quantityMatrial = QuantityMatrial.total;
                  }
                  setState(() {});
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          sectionTitle('Dispatch Details (Per Sales)'),
          const SizedBox(height: 5),
          BlocBuilder<DispatchDetailsPerSalesCubit,
              DispatchDetailsPerSalesState>(
            builder: (context, state) {
              if (state is DispatchDetailsPerSalesSuccess) {
                sales = state.dispatchDetails.first.monthDays?.first.dataValues!
                        .map((v) => v.name ?? '')
                        .toList() ??
                    [];

                return buildSalesTopHeader(
                    state.dispatchDetails[0].monthDays?[0].dataValues ?? [],
                    sales,
                    _headerController);
              } else {
                return buildSalesTopHeader([], [], _headerController);
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BlocBuilder<DispatchDetailsPerSalesCubit,
                  DispatchDetailsPerSalesState>(
                builder: (context, state) {
                  if (state is DispatchDetailsPerSalesSuccess) {
                    double scrollableWidth =
                        (2 * cellWidth) + (sales.length * cellWidth);
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFixedSideColumn(state.dispatchDetails),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _bodyController,
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: scrollableWidth,
                              child: Column(children: [
                                ...List.generate(state.dispatchDetails.length,
                                    (index) {
                                  return buildMonthDataPerSales(
                                    state.dispatchDetails[index],
                                    index,
                                    sales,
                                    totalBorder,
                                    _expandedMonths,
                                    quantityType,
                                    quantityMatrial,
                                  );
                                }),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is DispatchDetailsPerSalesFailure) {
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
      List<DispatchDetailsModel> dispatchDetailsResponse) {
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

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/get_months_of_year.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_details_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatches_region_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/value_data_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/build_header_per_sales.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/table_data_item.dart';

class DispatchDetailsPerSalesSuccessV2 extends StatefulWidget {
  const DispatchDetailsPerSalesSuccessV2({
    super.key,
    required this.dispatchList,
    required this.year,
    required this.viewType,
  });
  final List<DispatchDetailsEntity> dispatchList;
  final int year;
  final String viewType;
  @override
  State<DispatchDetailsPerSalesSuccessV2> createState() =>
      _DispatchDetailsPerSalesSuccessV2State();
}

class _DispatchDetailsPerSalesSuccessV2State
    extends State<DispatchDetailsPerSalesSuccessV2> {
  final Map<String, bool> _expandedSales = {};

  @override
  Widget build(BuildContext context) {
    final List<DispatchDetailsEntity> disList = List.from(widget.dispatchList);

    final DispatchDetailsEntity totalDis = disList.last;

    disList.removeLast();
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1500, // Set a fixed width for the table
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderPerSalesRow(widget.viewType),
              const Divider(
                height: .5,
                color: Color.fromARGB(255, 226, 226, 226),
              ),
              ...disList.map((disPerSales) {
                final sales = disPerSales.name;
                final isExpanded = _expandedSales[sales] ?? false;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _expandedSales[sales] = !isExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        color: const Color.fromARGB(255, 237, 237, 238),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(isExpanded
                                  ? Symbols.keyboard_arrow_down
                                  : Symbols.keyboard_arrow_right),
                            ),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  disPerSales.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )),
                            widget.viewType == "Dates"
                                ? const Expanded(
                                    flex: 2, child: Center(child: Text("")))
                                : const Expanded(
                                    flex: 3, child: Center(child: Text(""))),
                            for (var month in getMonths(DateTime.now().year))
                              Expanded(
                                flex: 3,
                                child: TableDataItem(
                                  value: disPerSales.months
                                      .where((m) => m.name == month)
                                      .firstOrNull!
                                      .totalEntity
                                      .value,
                                  month: month,
                                  regions: disPerSales.months
                                      .where((m) => m.name == month)
                                      .firstOrNull!
                                      .totalEntity
                                      .dispatches!,
                                ),
                              ),
                            Expanded(
                              flex: 3,
                              child: TableDataItem(
                                value: disPerSales.total.value,
                                regions: disPerSales.total.dispatches!,
                                month: "Total",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TableDataItem(
                                value: disPerSales.totalToday.value,
                                regions: disPerSales.totalToday.dispatches!,
                                month: "Today",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  disPerSales.totalCheckedIn,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(disPerSales.totalLoading),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      ...(widget.viewType == "Dates"
                          ? disPerSales.values.map((entry) {
                              return _buildDateRow(
                                entry,
                                widget.year,
                              );
                            })
                          : disPerSales.dispatches!.map((entry) {
                              return _buildRegionRow(
                                entry,
                              );
                            })),
                  ],
                );
              }),
              InkWell(
                onTap: null,
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 237, 237, 238),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(Symbols.keyboard_arrow_right),
                      ),
                      Expanded(
                          flex: 4,
                          child: Text(
                            totalDis.name.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                      widget.viewType == "Dates"
                          ? const Expanded(
                              flex: 2, child: Center(child: Text("")))
                          : const Expanded(
                              flex: 3, child: Center(child: Text(""))),
                      for (var month in getMonths(DateTime.now().year))
                        Expanded(
                          flex: 3,
                          child: TableDataItem(
                            value: totalDis.months!
                                .where((m) => m.name == month)
                                .firstOrNull!
                                .totalEntity
                                .value,
                            month: month,
                            regions: totalDis.months
                                .where((m) => m.name == month)
                                .firstOrNull!
                                .totalEntity
                                .dispatches!,
                          ),
                        ),
                      Expanded(
                        flex: 3,
                        child: TableDataItem(
                          value: totalDis.total.value,
                          regions: totalDis.total.dispatches!,
                          month: "Total",
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TableDataItem(
                          value: totalDis.totalToday.value,
                          regions: totalDis.totalToday.dispatches!,
                          month: "Today",
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(totalDis.totalCheckedIn),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            totalDis.totalLoading,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateRow(
    ValueDataEntity item,
    int year,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          const Expanded(flex: 4, child: Center(child: Text(""))),
          Expanded(flex: 2, child: Center(child: Text('${item.date}|$year'))),
          for (var month in getMonths(DateTime.now().year))
            Expanded(
              flex: 3,
              child: TableDataItem(
                value: item.dispatches
                    .where((m) => m.name == month)
                    .firstOrNull!
                    .value
                    .value,
                regions: item.dispatches
                    .where((m) => m.name == month)
                    .firstOrNull!
                    .value
                    .dispatches!,
                month: '${item.date}|$month',
              ),
            ),
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(
            flex: 3,
            child: Center(child: Text("")),
          ),
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(flex: 3, child: Center(child: Text(""))),
        ],
      ),
    );
  }

  Widget _buildRegionRow(
    DispatchesRegionEntity item,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          const Expanded(flex: 4, child: Center(child: Text(""))),
          Expanded(flex: 3, child: Center(child: Text(item.name))),
          for (var month in getMonths(DateTime.now().year))
            Expanded(
              flex: 3,
              child: TableDataItem(
                value: item.dispatches
                    .where((m) => m.name == month)
                    .firstOrNull!
                    .value
                    .value,
                regions: item.dispatches
                    .where((m) => m.name == month)
                    .firstOrNull!
                    .value
                    .dispatches!,
                month: month,
              ),
            ),
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(
            flex: 3,
            child: Center(child: Text("")),
          ),
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(flex: 3, child: Center(child: Text(""))),
        ],
      ),
    );
  }
}

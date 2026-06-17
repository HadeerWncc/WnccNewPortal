import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/utils/methods/get_months_of_year.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatches_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/values_date.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/build_header_per_sales.dart';

class DispatchDetailsPerSalesSuccessV2 extends StatefulWidget {
  const DispatchDetailsPerSalesSuccessV2(
      {super.key,
      required this.dispatchList,
      required this.year,
      required this.viewType,
      required this.incoterm,
      required this.type});
  final List<DispatchDetailsVsModel> dispatchList;
  final int year;
  final String viewType;
  final List<String> incoterm;
  final List<String> type;
  @override
  State<DispatchDetailsPerSalesSuccessV2> createState() =>
      _DispatchDetailsPerSalesSuccessV2State();
}

class _DispatchDetailsPerSalesSuccessV2State
    extends State<DispatchDetailsPerSalesSuccessV2> {
  final Map<String, bool> _expandedSales = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1400, // Set a fixed width for the table
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderPerSalesRow(widget.viewType),
              const Divider(
                height: .5,
                color: Color.fromARGB(255, 226, 226, 226),
              ),
              ...widget.dispatchList.map((disPerSales) {
                final sales = disPerSales.name;
                // final orders = entry.value;
                // final payerTotal = entry.value
                //     .fold<num>(0, (sum, order) => sum + (order.));
                final isExpanded = _expandedSales[sales] ?? false;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _expandedSales[sales!] = !isExpanded;
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
                                child: Center(
                                  child: Text(geyDisValue(
                                    disPerSales.months!
                                        .where((m) => m.name == month)
                                        .firstOrNull!
                                        .value!
                                        .value!,
                                    widget.incoterm,
                                    widget.type,
                                  )),
                                ),
                              ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  formatNum(
                                    (disPerSales.total!.value!.total ?? 0)
                                        .round(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  formatNum(
                                    (disPerSales.totalToday!.value!.total ?? 0)
                                        .round(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  formatNum(
                                    (disPerSales.totalCheckedIn!.total ?? 0)
                                        .round(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  formatNum(
                                    (disPerSales.totalLoading!.total ?? 0)
                                        .round(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      ...(widget.viewType == "Dates"
                          ? disPerSales.values!.map((entry) {
                              return _buildDateRow(
                                entry,
                                widget.year,
                                widget.incoterm,
                                widget.type,
                              );
                            })
                          : disPerSales.dispatches!.map((entry) {
                              return _buildRegionRow(
                                entry,
                                widget.incoterm,
                                widget.type,
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
                        child: SizedBox(),
                      ),
                      const Expanded(
                          flex: 4,
                          child: Text(
                            "Total Dispatch",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                      widget.viewType == "Dates"
                          ? const Expanded(
                              flex: 2, child: Center(child: Text("")))
                          : const Expanded(
                              flex: 3, child: Center(child: Text(""))),
                      for (var month in getMonths(DateTime.now().year))
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              formatNum(
                                widget.dispatchList
                                    .fold<double>(
                                      0,
                                      (sum, item) =>
                                          sum +
                                          (item.months
                                                  ?.where(
                                                      (m) => m.name == month)
                                                  .firstOrNull
                                                  ?.value
                                                  ?.value
                                                  ?.total ??
                                              0),
                                    )
                                    .round(),
                              ),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            formatNum(
                              widget.dispatchList
                                  .fold<double>(
                                    0,
                                    (sum, item) =>
                                        sum + (item.total!.value!.total ?? 0),
                                  )
                                  .round(),
                            ),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            formatNum(
                              widget.dispatchList
                                  .fold<double>(
                                    0,
                                    (sum, item) =>
                                        sum +
                                        (item.totalToday!.value!.total ?? 0),
                                  )
                                  .round(),
                            ),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            formatNum(
                              widget.dispatchList
                                  .fold<double>(
                                    0,
                                    (sum, item) =>
                                        sum + (item.totalCheckedIn!.total ?? 0),
                                  )
                                  .round(),
                            ),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            formatNum(
                              widget.dispatchList
                                  .fold<double>(
                                    0,
                                    (sum, item) =>
                                        sum + (item.totalLoading!.total ?? 0),
                                  )
                                  .round(),
                            ),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateRow(
    ValuesDate item,
    int year,
    List<String> incoterm,
    List<String> type,
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
              child: Center(
                child: Text(
                  geyDisValue(
                    item.dispatches!
                        .where((m) => m.name == month)
                        .firstOrNull!
                        .value!
                        .value!,
                    incoterm,
                    type,
                  ),
                ),
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
    DispatchesRegion item,
    List<String> incoterm,
    List<String> type,
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
          Expanded(flex: 3, child: Center(child: Text('${item.name}'))),
          for (var month in getMonths(DateTime.now().year))
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  geyDisValue(
                    item.dispatches!
                        .where((m) => m.name == month)
                        .firstOrNull!
                        .value!
                        .value!,
                    incoterm,
                    type,
                  ),
                ),
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

  String geyDisValue(Value value, List<String> incoterm, List<String> type) {
    if ((incoterm.isEmpty || incoterm.length > 1) &&
        (type.isEmpty || type.length > 1)) {
      return formatNum((value.total ?? 0).round());
    } else if ((incoterm.isEmpty || incoterm.length > 1)) {
      // not empty and length = 1
      if (type[0] == "Bags") {
        return formatNum(((value.pickupQuantity!.bags ?? 0) +
                (value.deliveryQuantity!.bags ?? 0))
            .round());
      } else {
        return formatNum(((value.pickupQuantity!.bulk ?? 0) +
                (value.deliveryQuantity!.bulk ?? 0))
            .round());
      }
    } else if ((type.isEmpty || type.length > 1)) {
      if (incoterm[0] == "Delivery") {
        return formatNum((value.deliveryQuantity!.total ?? 0).round());
      } else {
        return formatNum((value.pickupQuantity!.total ?? 0).round());
      }
    } else {
      if (incoterm[0] == "Delivery") {
        if (type[0] == "Bags") {
          return formatNum((value.deliveryQuantity!.bags ?? 0).round());
        } else {
          return formatNum((value.deliveryQuantity!.bulk ?? 0).round());
        }
      } else {
        if (type[0] == "Bags") {
          return formatNum((value.pickupQuantity!.bags ?? 0).round());
        } else {
          return formatNum((value.pickupQuantity!.bulk ?? 0).round());
        }
      }
    }

    // if(incoterm.length == 1){
    //   if(type == )
    // }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/utils/methods/get_months_of_year.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/dispatch_details_vs_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/values_date.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/build_header_per_sales.dart';

class DispatchDetailsPerSalesSuccessV2 extends StatefulWidget {
  const DispatchDetailsPerSalesSuccessV2(
      {super.key, required this.dispatchList});
  final List<DispatchDetailsVsModel> dispatchList;

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
              buildHeaderPerSalesRow(),
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
                            const Expanded(
                                flex: 2, child: Center(child: Text(""))),
                            for (var month in getMonths(DateTime.now().year))
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    formatNum((disPerSales.months!
                                                .where((m) => m.name == month)
                                                .firstOrNull!
                                                .value!
                                                .value!
                                                .total ??
                                            0)
                                        .round()),
                                  ),
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
                      ...disPerSales.values!.map((entry) {
                        return _buildDataRow(entry);
                      }),
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
                      const Expanded(flex: 2, child: Center(child: Text(""))),
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
                           style: const TextStyle(fontWeight: FontWeight.bold), ),
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

  Widget _buildDataRow(
    ValuesDate item,
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
          Expanded(flex: 2, child: Center(child: Text(item.date.toString()))),
          for (var month in getMonths(DateTime.now().year))
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  formatNum(
                    (item.dispatches!
                                .where((m) => m.name == month)
                                .firstOrNull!
                                .value!
                                .value!
                                .total ??
                            0)
                        .round(),
                  ),
                ),
              ),
            ),
          Expanded(flex: 3, child: Center(child: Text(""))),
          Expanded(
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

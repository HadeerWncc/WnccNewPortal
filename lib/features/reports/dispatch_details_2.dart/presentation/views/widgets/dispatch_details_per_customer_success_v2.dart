import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/get_months_of_year.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_details_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatches_region_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/value_data_entity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/build_header_per_customer_row.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/table_data_item.dart';

class DispatchDetailsPerCustomerSuccessV2 extends StatefulWidget {
  const DispatchDetailsPerCustomerSuccessV2({
    super.key,
    required this.dispatchList,
    required this.year,
    required this.viewType,
  });
  final List<DispatchDetailsEntity> dispatchList;
  final int year;
  final String viewType;
  @override
  State<DispatchDetailsPerCustomerSuccessV2> createState() =>
      _DispatchDetailsPerCustomerSuccessV2State();
}

class _DispatchDetailsPerCustomerSuccessV2State
    extends State<DispatchDetailsPerCustomerSuccessV2> {
  final Map<String, bool> _expandedCustomer = {};
  @override
  Widget build(BuildContext context) {
    final List<DispatchDetailsEntity> disList = List.from(widget.dispatchList);

    final DispatchDetailsEntity totalDis = disList.last;

    disList.removeLast();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          SizedBox(
            width: 1900,
            height: MediaQuery.of(context).size.height * .5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildHeaderPerCustomerRow(widget.viewType),
              const Divider(
                height: .5,
                color: Color.fromARGB(255, 226, 226, 226),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...disList.map((disPerCust) {
                      final cust = disPerCust.id;
                      final isExpanded = _expandedCustomer[cust] ?? false;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _expandedCustomer[cust] = !isExpanded;
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
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          int.parse(disPerCust.id).toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          disPerCust.rank,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 6,
                                      child: Center(
                                        child: Text(
                                          disPerCust.name.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  widget.viewType == "Dates"
                                      ? const Expanded(
                                          flex: 2,
                                          child: Center(child: Text("")))
                                      : const Expanded(
                                          flex: 3,
                                          child: Center(child: Text(""))),
                                  for (var month
                                      in getMonths(DateTime.now().year))
                                    Expanded(
                                      flex: 3,
                                      child: TableDataItem(
                                        value: disPerCust.months
                                            .where((m) => m.name == month)
                                            .firstOrNull!
                                            .totalEntity
                                            .value,
                                        month: month,
                                        regions: disPerCust.months
                                            .where((m) => m.name == month)
                                            .firstOrNull!
                                            .totalEntity
                                            .dispatches!,
                                      ),
                                    ),
                                  Expanded(
                                    flex: 3,
                                    child: TableDataItem(
                                      value: disPerCust.total.value,
                                      regions: disPerCust.total.dispatches!,
                                      month: "Total",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TableDataItem(
                                      value: disPerCust.totalToday.value,
                                      regions:
                                          disPerCust.totalToday.dispatches!,
                                      month: "Today",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(disPerCust.totalCheckedIn),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(disPerCust.totalLoading),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Center(
                                        child: Text(
                                          disPerCust.salesName.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          if (isExpanded)
                            ...(widget.viewType == "Dates"
                                ? disPerCust.values.map((entry) {
                                    return _buildDateRow(
                                      entry,
                                      widget.year,
                                    );
                                  })
                                : disPerCust.dispatches.map((entry) {
                                    return _buildRegionRow(
                                      entry,
                                    );
                                  })),
                        ],
                      );
                    }),
                  ]),
                ),
              ),
              InkWell(
                onTap: null,
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 217, 217, 217),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(Symbols.keyboard_arrow_right),
                      ),
                      const Expanded(
                          flex: 3,
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const Expanded(
                          flex: 2,
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 6,
                          child: Center(
                            child: Text(
                              totalDis.name.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                            value: totalDis.months
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
                          child: Text(totalDis.totalLoading),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Text(
                            totalDis.name.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );

    // return Expanded(
    //   child: SingleChildScrollView(
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: SizedBox(
    //         width: 1800, // Set a fixed width for the table
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             buildHeaderPerCustomerRow(widget.viewType),
    //             const Divider(
    //               height: .5,
    //               color: Color.fromARGB(255, 226, 226, 226),
    //             ),
    //             ...widget.dispatchList.map((disPerCust) {
    //               final cust = disPerCust.id ?? '';
    //               final isExpanded = _expandedCustomer[cust] ?? false;

    //               return Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   InkWell(
    //                     onTap: () {
    //                       setState(() {
    //                         _expandedCustomer[cust] = !isExpanded;
    //                       });
    //                     },
    //                     child: Container(
    //                       width: double.infinity,
    //                       color: const Color.fromARGB(255, 237, 237, 238),
    //                       padding: const EdgeInsets.symmetric(
    //                           vertical: 14, horizontal: 12),
    //                       child: Row(
    //                         children: [
    //                           Expanded(
    //                             flex: 1,
    //                             child: Icon(isExpanded
    //                                 ? Symbols.keyboard_arrow_down
    //                                 : Symbols.keyboard_arrow_right),
    //                           ),
    //                           Expanded(
    //                               flex: 3,
    //                               child: Center(
    //                                 child: Text(
    //                                   int.parse(disPerCust.id ?? '').toString(),
    //                                   style: const TextStyle(
    //                                       fontWeight: FontWeight.bold),
    //                                 ),
    //                               )),
    //                           Expanded(
    //                               flex: 2,
    //                               child: Center(
    //                                 child: Text(
    //                                   disPerCust.rank.toString(),
    //                                   style: const TextStyle(
    //                                       fontWeight: FontWeight.bold),
    //                                 ),
    //                               )),
    //                           Expanded(
    //                               flex: 6,
    //                               child: Center(
    //                                 child: Text(
    //                                   disPerCust.name.toString(),
    //                                   style: const TextStyle(
    //                                       fontWeight: FontWeight.bold),
    //                                 ),
    //                               )),
    //                           widget.viewType == "Dates"
    //                               ? const Expanded(
    //                                   flex: 2, child: Center(child: Text("")))
    //                               : const Expanded(
    //                                   flex: 3, child: Center(child: Text(""))),
    //                           for (var month in getMonths(DateTime.now().year))
    //                             Expanded(
    //                               flex: 3,
    //                               child: TableDataItem(
    //                                 value: disPerCust.months!
    //                                     .where((m) => m.name == month)
    //                                     .firstOrNull!
    //                                     .value!
    //                                     .value!,
    //                                 incoterm: widget.incoterm,
    //                                 type: widget.type,
    //                                 month: month,
    //                                 regions: disPerCust.months!
    //                                     .where((m) => m.name == month)
    //                                     .firstOrNull!
    //                                     .value!
    //                                     .dispatches!,
    //                               ),
    //                             ),
    //                           Expanded(
    //                             flex: 3,
    //                             child: TableDataItem(
    //                               value: disPerCust.total!.value!,
    //                               regions: disPerCust.total!.dispatches!,
    //                               incoterm: widget.incoterm,
    //                               type: widget.type,
    //                               month: "Total",
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 3,
    //                             child: TableDataItem(
    //                               value: disPerCust.totalToday!.value!,
    //                               regions: disPerCust.totalToday!.dispatches!,
    //                               incoterm: widget.incoterm,
    //                               type: widget.type,
    //                               month: "Today",
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 3,
    //                             child: Center(
    //                               child: Text(
    //                                 geyDisValue(
    //                                   disPerCust.totalCheckedIn!,
    //                                   widget.incoterm,
    //                                   widget.type,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 3,
    //                             child: Center(
    //                               child: Text(
    //                                 geyDisValue(
    //                                   disPerCust.totalLoading!,
    //                                   widget.incoterm,
    //                                   widget.type,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Expanded(
    //                               flex: 4,
    //                               child: Center(
    //                                 child: Text(
    //                                   disPerCust.salesName.toString(),
    //                                   style: const TextStyle(
    //                                       fontWeight: FontWeight.bold),
    //                                 ),
    //                               )),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   if (isExpanded)
    //                     ...(widget.viewType == "Dates"
    //                         ? disPerCust.values!.map((entry) {
    //                             return _buildDateRow(
    //                               entry,
    //                               widget.year,
    //                               widget.incoterm,
    //                               widget.type,
    //                             );
    //                           })
    //                         : disPerCust.dispatches!.map((entry) {
    //                             return _buildRegionRow(
    //                               entry,
    //                               widget.incoterm,
    //                               widget.type,
    //                             );
    //                           })),
    //                 ],
    //               );
    //             }),
    //             InkWell(
    //               onTap: null,
    //               child: Container(
    //                 width: double.infinity,
    //                 color: const Color.fromARGB(255, 237, 237, 238),
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 14, horizontal: 12),
    //                 child: Row(
    //                   children: [
    //                     const Expanded(
    //                       flex: 1,
    //                       child: Icon(Symbols.keyboard_arrow_right),
    //                     ),
    //                     const Expanded(
    //                         flex: 3,
    //                         child: Text(
    //                           '',
    //                           style: TextStyle(fontWeight: FontWeight.bold),
    //                         )),
    //                     const Expanded(
    //                         flex: 2,
    //                         child: Text(
    //                           '',
    //                           style: TextStyle(fontWeight: FontWeight.bold),
    //                         )),
    //                     Expanded(
    //                         flex: 5,
    //                         child: Text(
    //                           totalDis.name.toString(),
    //                           style:
    //                               const TextStyle(fontWeight: FontWeight.bold),
    //                         )),
    //                     widget.viewType == "Dates"
    //                         ? const Expanded(
    //                             flex: 2, child: Center(child: Text("")))
    //                         : const Expanded(
    //                             flex: 3, child: Center(child: Text(""))),
    //                     for (var month in getMonths(DateTime.now().year))
    //                       Expanded(
    //                         flex: 3,
    //                         child: TableDataItem(
    //                           value: totalDis.months!
    //                               .where((m) => m.name == month)
    //                               .firstOrNull!
    //                               .value!
    //                               .value!,
    //                           incoterm: widget.incoterm,
    //                           type: widget.type,
    //                           month: month,
    //                           regions: totalDis.months!
    //                               .where((m) => m.name == month)
    //                               .firstOrNull!
    //                               .value!
    //                               .dispatches!,
    //                         ),
    //                       ),
    //                     Expanded(
    //                       flex: 3,
    //                       child: TableDataItem(
    //                         value: totalDis.total!.value!,
    //                         regions: totalDis.total!.dispatches!,
    //                         incoterm: widget.incoterm,
    //                         type: widget.type,
    //                         month: "Total",
    //                       ),
    //                     ),
    //                     Expanded(
    //                       flex: 3,
    //                       child: TableDataItem(
    //                         value: totalDis.totalToday!.value!,
    //                         regions: totalDis.totalToday!.dispatches!,
    //                         incoterm: widget.incoterm,
    //                         type: widget.type,
    //                         month: "Today",
    //                       ),
    //                     ),
    //                     Expanded(
    //                       flex: 3,
    //                       child: Center(
    //                         child: Text(
    //                           geyDisValue(
    //                             totalDis.totalCheckedIn!,
    //                             widget.incoterm,
    //                             widget.type,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       flex: 3,
    //                       child: Center(
    //                         child: Text(
    //                           geyDisValue(
    //                             totalDis.totalLoading!,
    //                             widget.incoterm,
    //                             widget.type,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                         flex: 4,
    //                         child: Text(
    //                           totalDis.name.toString(),
    //                           style:
    //                               const TextStyle(fontWeight: FontWeight.bold),
    //                         )),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(flex: 2, child: Center(child: Text(""))),
          const Expanded(flex: 6, child: Center(child: Text(""))),
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
          const Expanded(flex: 4, child: Center(child: Text(""))),
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
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(flex: 2, child: Center(child: Text(""))),
          const Expanded(flex: 6, child: Center(child: Text(""))),
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
          const Expanded(flex: 4, child: Center(child: Text(""))),
        ],
      ),
    );
  }
}

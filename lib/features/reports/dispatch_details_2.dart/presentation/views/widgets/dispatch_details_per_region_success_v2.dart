import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/objects.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/helper/get_areas_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/relation_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/build_header_per_region_row.dart';

class DispatchDetailsPerRegionSuccessV2 extends StatefulWidget {
  const DispatchDetailsPerRegionSuccessV2({
    super.key,
    required this.dispatchList,
    required this.year,
    required this.incotrem,
    required this.types,
    required this.regions,
  });
  final List<DispatchDetailsPerRegionModel> dispatchList;
  final int year;
  final List<String> incotrem;
  final List<String> types;
  final List<String> regions;
  @override
  State<DispatchDetailsPerRegionSuccessV2> createState() =>
      _DispatchDetailsPerRegionSuccessV2State();
}

class _DispatchDetailsPerRegionSuccessV2State
    extends State<DispatchDetailsPerRegionSuccessV2> {
  final Map<String, bool> _expandedRegion = {};

  @override
  Widget build(BuildContext context) {
    final List<DispatchDetailsPerRegionModel> disList =
        List.from(widget.dispatchList);
    final totalAreas = getTotalAreas(disList);

    // final DispatchDetailsPerRegionModel totalDis = disList.last;

    // disList.removeLast();
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1500, // Set a fixed width for the table
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderPerRegionRow(disList, widget.regions),
              const Divider(
                height: .5,
                color: Color.fromARGB(255, 226, 226, 226),
              ),
              ...disList.map((disPerRegion) {
                final monthDate = disPerRegion.monthDate ?? '';
                final isExpanded = _expandedRegion[monthDate] ?? false;
                final monthAreas = getAreas(disPerRegion, disList);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _expandedRegion[monthDate] = !isExpanded;
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
                                    'Total Dispatch ${DateFormat("MMM").format(DateTime.parse(disPerRegion.monthDate!))}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            for (var area in monthAreas)
                              // Row(
                              //   children:
                              ...[
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    getDisValue(
                                      area.quantity!,
                                      widget.incotrem,
                                      widget.types,
                                    ),
                                  ),
                                ),
                              ),
                              ...widget.regions.map((r) {
                                RelationValue? region;

                                for (final item in area.relationValues ??
                                    <RelationValue>[]) {
                                  if (item.name == r) {
                                    region = item;
                                    break;
                                  }
                                }
                                return Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(getDisValue(
                                      region?.quantity ?? defaultQuantity,
                                      widget.incotrem,
                                      widget.types,
                                    )),
                                  ),
                                );
                              })
                            ],
                            // ),
                            Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(getDisValue(
                                      getMonthTotal(disPerRegion),
                                      widget.incotrem,
                                      widget.types)),
                                )),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      ...disPerRegion.monthDays!.map((entry) {
                        return _buildDateRow(
                          totalAreas,
                          entry,
                          widget.year,
                        );
                      })
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
                      const Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "Total Dispatch",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                      for (var area in totalAreas)
                        // Row(
                        //   children:
                        ...[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              getDisValue(area.quantity!, widget.incotrem,
                                  widget.types),
                            ),
                          ),
                        ),
                        ...widget.regions.map((r) {
                          RelationValue? region;

                          for (final item
                              in area.relationValues ?? <RelationValue>[]) {
                            if (item.name == r) {
                              region = item;
                              break;
                            }
                          }
                          return Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                getDisValue(
                                  region?.quantity ?? defaultQuantity,
                                  widget.incotrem,
                                  widget.types,
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                      // ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(getDisValue(
                            getGrandTotal(disList),
                            widget.incotrem,
                            widget.types,
                          )),
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
    List<DataValue> areas,
    MonthDay item,
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
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  DateFormat("d/M/yyyy").format(
                    DateTime.parse(item.date!),
                  ),
                ),
              ),
            ),
            ...areas.expand((area) {
              final dayDataValue = item.dataValues
                  ?.where((d) => d.name == area.name)
                  .cast<DataValue?>()
                  .firstOrNull;

              return <Widget>[
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      dayDataValue == null
                          ? '0'
                          : getDisValue(
                              dayDataValue.quantity!,
                              widget.incotrem,
                              widget.types,
                            ),
                    ),
                  ),
                ),
                ...widget.regions.map((r) {
                  RelationValue? region;

                  for (final item
                      in dayDataValue?.relationValues ?? <RelationValue>[]) {
                    if (item.name == r) {
                      region = item;
                      break;
                    }
                  }

                  return Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        getDisValue(
                          region?.quantity ?? defaultQuantity,
                          widget.incotrem,
                          widget.types,
                        ),
                      ),
                    ),
                  );
                }),
              ];
            }),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  getDisValue(
                    item.total ?? defaultQuantity,
                    widget.incotrem,
                    widget.types,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

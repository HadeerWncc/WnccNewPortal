import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/shipment_details_cubit/shipment_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_month_data.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_shipment_data.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_top_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_header.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class DispatchTablesBody extends StatefulWidget {
  const DispatchTablesBody(
      {super.key, required this.dispatchDetailsResponse, required this.year});
  final List<DispatchDetailsModel> dispatchDetailsResponse;
  final int year;

  @override
  State<DispatchTablesBody> createState() => _DispatchTablesBodyState();
}

class _DispatchTablesBodyState extends State<DispatchTablesBody> {
  late LinkedScrollControllerGroup _horizontalControllers;
  late ScrollController _headerController;
  late ScrollController _bodyController;

  final Map<int, bool> _expandedMonths = {};

  static const double dateWidth = 150.0;
  static const double cellWidth = 100.0;
  List<String> allRegions =[];
  List<String> regions = [];
  @override
  void initState() {
    super.initState();
    _horizontalControllers = LinkedScrollControllerGroup();
    _headerController = _horizontalControllers.addAndGet();
    _bodyController = _horizontalControllers.addAndGet();

    for (var i = 0; i < widget.dispatchDetailsResponse.length; i++) {
      _expandedMonths[i] = false;
    }

    allRegions = widget.dispatchDetailsResponse.isNotEmpty
        ? (widget.dispatchDetailsResponse.first.monthDays?.first.regions ?? [])
            .map((d) => d.regionName!)
            .toList()
        : <String>[];
    regions = widget.dispatchDetailsResponse.isNotEmpty
        ? (widget.dispatchDetailsResponse.first.monthDays?.first.regions ?? [])
            .where((r) => r.enableDispatchReporting == true)
            .map((d) => d.regionName!)
            .toList()
        : <String>[];
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
    
    List<DispatchRegion> visibleRegions = widget
            .dispatchDetailsResponse.isNotEmpty
        ? (widget.dispatchDetailsResponse.first.monthDays?.first.regions ?? [])
            .where((r) => regions.contains(r.regionName))
            .cast<DispatchRegion>()
            .toList()
        : <DispatchRegion>[];

    final double scrollableWidth =
        (7 * cellWidth) + (visibleRegions.length * cellWidth);

    return BlocBuilder<ShipmentDetailsCubit, ShipmentDetailsState>(
      builder: (context, state) {
        if (state is ShipmentDetailsSuccess) {
          return Expanded(
            child: Column(
              children: [
                DispatchDetailsHeader(
                  allCities: allRegions,
                  selectedCities: regions,
                  onChanged: (values){
                    regions = values;
                    setState(() {
                      
                    });
                  },
                ),
                const SizedBox(height: 16),
                sectionTitle('Dispatch Details'),
                const SizedBox(height: 5),
                buildTopHeader(visibleRegions, _headerController),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFixedSideColumn(
                            visibleRegions, widget.dispatchDetailsResponse),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _bodyController,
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: scrollableWidth,
                              child: Column(children: [
                                ...List.generate(
                                    widget.dispatchDetailsResponse.length,
                                    (index) {
                                  return buildMonthData(
                                      widget.dispatchDetailsResponse[index],
                                      index,
                                      visibleRegions,
                                      totalBorder,
                                      _expandedMonths);
                                }),
                                ...List.generate(state.shipmentDetails.length,
                                    (index) {
                                  return buildShipmentData(
                                      state.shipmentDetails[index],
                                      visibleRegions,
                                      totalBorder);
                                })
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget buildFixedSideColumn(List<DispatchRegion> regions,
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
                "${isExpanded ? '▼' : '▶'} Total Dispatch (${month.monthLabel})",
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
      buildCell(
        "Checked-In",
        width: dateWidth,
        isHeader: true,
        color: const Color(0xFFf3f3f3),
        border: totalBorder,
      ),
      buildCell(
        "Loading Start",
        width: dateWidth,
        isHeader: true,
        color: const Color(0xFFf3f3f3),
        border: totalBorder,
      ),
    ]);
  }
}

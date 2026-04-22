import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

class DispatchDetailsPerRegionTable extends StatefulWidget {
  const DispatchDetailsPerRegionTable({
    super.key,
    required this.dispatchDetailsResponse,
  });

  final List<DispatchDetailsModel> dispatchDetailsResponse;

  @override
  State<DispatchDetailsPerRegionTable> createState() =>
      _DispatchDetailsPerRegionTableState();
}

class _DispatchDetailsPerRegionTableState
    extends State<DispatchDetailsPerRegionTable> {
  late LinkedScrollControllerGroup _horizontalControllers;
  late ScrollController _headerController;
  late ScrollController _bodyController;

  final Map<int, bool> _expandedMonths = {};

  static const double dateWidth = 150.0;
  static const double cellWidth = 100.0;

  QuantityType quantityType = QuantityType.total;

  /// ✅ selected regions (IMPORTANT)
  List<String> selectedRegions = [];

  @override
  void initState() {
    super.initState();

    _horizontalControllers = LinkedScrollControllerGroup();
    _headerController = _horizontalControllers.addAndGet();
    _bodyController = _horizontalControllers.addAndGet();

    for (var i = 0; i < widget.dispatchDetailsResponse.length; i++) {
      _expandedMonths[i] = false;
    }
  }

  @override
  void dispose() {
    _headerController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  BoxBorder totalBorder = const Border.symmetric(
    horizontal: BorderSide(
      color: Color.fromARGB(255, 45, 83, 33),
      width: .5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFixedSideColumn(widget.dispatchDetailsResponse),
          ],
        ),
      ),
    );
  }

  // ----------------------------
  // 🔹 FIXED SIDE COLUMN
  // ----------------------------
  Widget buildFixedSideColumn(
    List<DispatchDetailsModel> dispatchDetailsResponse,
  ) {
    if (dispatchDetailsResponse.isEmpty) {
      return const SizedBox();
    }

    final firstDay = dispatchDetailsResponse.first.monthDays?.first;
    final dataValues = firstDay?.dataValues ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Areas + Regions
        ...dataValues.map((area) {
          final areaName = area.name ?? "Others";

          final filteredRegions = (area.relationValues ?? [])
              .where((r) => selectedRegions.contains(r.name ?? ""))
              .toList();

          if (filteredRegions.isEmpty) {
            return const SizedBox();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Area Header
              buildCell(
                areaName,
                width: dateWidth,
                isHeader: true,
                color: const Color(0xFFE0E0E0),
              ),

              /// Regions
              ...filteredRegions.map(
                (r) => buildCell(
                  r.name ?? "",
                  width: dateWidth,
                ),
              ),
            ],
          );
        }),

        const SizedBox(height: 10),

        /// 🔹 Months Table
        ...List.generate(dispatchDetailsResponse.length, (index) {
          final month = dispatchDetailsResponse[index];
          final isExpanded = _expandedMonths[index] ?? false;

          return Column(
            children: [
              GestureDetector(
                onTap: () =>
                    setState(() => _expandedMonths[index] = !isExpanded),
                child: buildCell(
                  "${isExpanded ? '▼' : '▶'} Total Dispatch (${DateFormat("MMM").format(DateTime.parse(month.monthDate!))})",
                  width: dateWidth,
                  isHeader: true,
                  color: const Color(0xFFf3f3f3),
                  border: totalBorder,
                ),
              ),

              if (isExpanded)
                ...(month.monthDays?.map(
                      (day) => buildCell(
                        DateFormat("d/M/yyyy")
                            .format(DateTime.parse(day.date!)),
                        width: dateWidth,
                        color: const Color(0xFFf3f3f3),
                      ),
                    ) ??
                    []),
            ],
          );
        }),
      ],
    );
  }
}
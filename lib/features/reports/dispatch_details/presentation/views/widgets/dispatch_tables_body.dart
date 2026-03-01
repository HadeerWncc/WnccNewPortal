import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class DispatchTablesBody extends StatelessWidget {
  const DispatchTablesBody(
      {super.key, required this.dispatchDetailsResponse, required this.year});
  final List<DispatchDetailsModel> dispatchDetailsResponse;
  final int year;
  @override
  Widget build(BuildContext context) {
    final grouped = groupRegionsByArea(dispatchDetailsResponse);

    final columns = buildColumns(grouped);

    final rows = buildRowsFromMonths(
      months: dispatchDetailsResponse,
      columns: columns,
      quantityType: QuantityType.total,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Dispatch Details'),
          const SizedBox(height: 8),
          buildDispatchTable(
            columns: columns,
            rows: rows,
          ),
          // buildDispatchDetailsTable(
          //     lableName: 'Date',
          //     year: year,
          //     dispatchDetailsResponse: dispatchDetailsResponse),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

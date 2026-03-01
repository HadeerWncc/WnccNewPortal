import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_cubit/dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_tables_body.dart';

class DispatchDetailsBody extends StatelessWidget {
  const DispatchDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
        builder: (context, state) {
          if (state is DispatchDetailsSuccess) {
            final grouped = groupRegionsByArea(state.dispatchDetailsList);

            final columns = buildColumns(grouped);

            final rows = buildRowsFromMonths(
              months: state.dispatchDetailsList,
              columns: columns,
              quantityType: QuantityType.total,
            );
            return Column(
              children: [
                DispatchDetailsHeader(
                  allCities: ['Alex'],
                  selectedCities: ['Alex'],
                ),
                SizedBox(height: 16),
                Expanded(
                    child: DispatchTablesBody(
                  dispatchDetailsResponse: state.dispatchDetailsList,
                  year: DateTime.now().year,
                )),
              ],
            );
          } else if (state is DispatchDetailsFailure) {
            return Text(state.error);
          } else {
            return Text('..Loading');
          }
        },
      ),
    );
  }
}

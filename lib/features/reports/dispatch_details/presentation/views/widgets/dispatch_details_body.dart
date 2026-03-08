import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_cubit/dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/shipment_details_cubit/shipment_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_tables_body.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class DispatchDetailsBody extends StatelessWidget {
  const DispatchDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
        builder: (context, state) {
          if (state is DispatchDetailsSuccess) {
            BlocProvider.of<ShipmentDetailsCubit>(context).getShipmentDetails();
            return Column(
              children: [
                DispatchTablesBody(
                  dispatchDetailsResponse: state.dispatchDetailsList,
                  year: DateTime.now().year,
                ),
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

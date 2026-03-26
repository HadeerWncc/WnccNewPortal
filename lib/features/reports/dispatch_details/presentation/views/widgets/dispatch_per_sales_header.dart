import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_sales_cubit/dispatch_details_per_sales_cubit.dart';

class DispatchPerSalesHeader extends StatelessWidget {
  const DispatchPerSalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: (MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.width * .4
            : MediaQuery.of(context).size.width * .9,
        child: CustomRangeDatePicker(
          title: 'Select Date Range',
          onChange: (value) {
            BlocProvider.of<DispatchDetailsPerSalesCubit>(context)
                .getDispatchDetailsPerSales(value.start, value.end);
          },
        ),
      ),
    );
  }
}

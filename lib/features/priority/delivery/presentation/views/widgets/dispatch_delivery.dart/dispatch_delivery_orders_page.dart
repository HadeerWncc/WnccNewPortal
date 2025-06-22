import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_section.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/date_picker.dart';

class DispatchDeliveryOrdersPage extends StatelessWidget {
  const DispatchDeliveryOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
  DateTime selectedDate = DateTime.now();

    String selectedDateString =
        DateFormat('yyyy-MM-dd').format(selectedDate).toString();
    BlocProvider.of<GetAllDeliveryCubit>(context)
        .getDeliveryDispatchByDate(selectedDateString);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: DatePicker(
            title: 'Selected Delivery Date',
            onChange: (value) {
              selectedDate = value;
              selectedDateString =
                  DateFormat('yyyy-MM-dd').format(value).toString();
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getDeliveryDispatchByDate(selectedDateString);
            },
          ),
        ),
        const SizedBox(height: 10),
        const PrioritySummary(),
        const SizedBox(height: 10),
        const DividerLine(),
        const SizedBox(height: 10),
        const DispatchDeliverySection(),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/dispatch_pickup/dispatch_pickup_section.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/date_picker.dart';

class DispatchPickupOrdersPage extends StatelessWidget {
  const DispatchPickupOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    BlocProvider.of<GetallPickupCubit>(context)
        .getAllDispatchPickupOrders(DateFormat('y-MM-dd').format(selectedDate));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: DatePicker(
            title: 'Selected Pickup Date',
            onChange: (value) {
              selectedDate = value;
              BlocProvider.of<GetallPickupCubit>(context)
                  .getAllDispatchPickupOrders(
                      DateFormat('y-MM-dd').format(selectedDate));
            },
          ),
        ),
        const SizedBox(height: 10),
        const PrioritySummary(),
        const SizedBox(height: 10),
        const DividerLine(),
        const SizedBox(height: 10),
        const DispatchPickupSection()
      ],
    );
  }
}

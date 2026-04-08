import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import '../../../managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'priority_pickup_section.dart';

class PriorityPickupOrdersPage extends StatelessWidget {
  const PriorityPickupOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetallPickupCubit>(context).getAllPriorityPickupOrders();
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        PrioritySummary(),
        SizedBox(height: 10),
        DividerLine(),
        SizedBox(height: 10),
        PriorityPickupSection()
      ],
    );
  }
}

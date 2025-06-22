import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/pending_delivery_section.dart';

class PendingDeliveryOrdersPage extends StatelessWidget {
  const PendingDeliveryOrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAllDeliveryCubit>(context).getAllDeliveryPending();
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        PrioritySummary(),
        SizedBox(height: 10),
        DividerLine(),
        SizedBox(height: 10),
        PendingDeliverySection(),
      ],
    );
  }
}

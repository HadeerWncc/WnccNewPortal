import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/loading_widgets/loading_row_table.dart';

class LoadingDispatchTable extends StatelessWidget {
  const LoadingDispatchTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Column(
        children: [
          LoadingRowTable(),
          LoadingRowTable(),
          LoadingRowTable(),
          LoadingRowTable(),
        ],
      ),
    );
  }
}

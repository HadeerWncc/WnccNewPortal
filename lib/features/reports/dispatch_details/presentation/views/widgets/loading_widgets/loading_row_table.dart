import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/loading_widgets/loading_data_cell.dart';

class LoadingRowTable extends StatelessWidget {
  const LoadingRowTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Date
        loadingDataCell(150),
        //Total
        loadingDataCell(100),
        /// ✅ Export
        loadingDataCell(100),
      ],
    );
  }
}
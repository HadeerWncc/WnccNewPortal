import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/compare_body.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/compare_header.dart';

class FactVsCustPageCompareBody extends StatefulWidget {
  const FactVsCustPageCompareBody({super.key});

  @override
  State<FactVsCustPageCompareBody> createState() =>
      _FactVsCustPageCompareBodyState();
}

class _FactVsCustPageCompareBodyState extends State<FactVsCustPageCompareBody> {
  bool openChart = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CompareHeader(
            onToggle: (value) {
              openChart = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          Expanded(
              child: CompareBody(
            openCharts: openChart,
          )),
        ],
      ),
    );
  }
}

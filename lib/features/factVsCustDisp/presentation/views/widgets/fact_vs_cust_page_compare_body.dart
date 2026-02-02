import 'package:flutter/material.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/compare_body.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/compare_header.dart';

class FactVsCustPageCompareBody extends StatelessWidget {
  const FactVsCustPageCompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CompareHeader(),
          SizedBox(height: 16),
          Expanded(child: CompareBody()),
        ],
      ),
    );
  }
}

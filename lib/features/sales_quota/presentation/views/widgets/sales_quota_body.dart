import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sales_quota_main_data.dart';

class SalesQuotaBody extends StatelessWidget {
  const SalesQuotaBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const SalesQuotaMainData(),
        )
      ],
    );
  }
}

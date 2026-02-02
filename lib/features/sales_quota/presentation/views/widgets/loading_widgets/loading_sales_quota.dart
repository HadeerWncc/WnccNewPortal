import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_card_data.dart';

class LoadingSalesQuota extends StatelessWidget {
  const LoadingSalesQuota({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Column(
        children: [
          LoadingCardData(),
        ],
      ),
    );
  }
}

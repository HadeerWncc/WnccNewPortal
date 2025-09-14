import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';

class LoadingDividerLine extends StatelessWidget {
  const LoadingDividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const DividerLine(),
    );
  }
}

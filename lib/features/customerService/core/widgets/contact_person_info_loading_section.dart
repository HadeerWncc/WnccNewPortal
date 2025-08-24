import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_info_item.dart';

class ContactPersonInfoLoadingSection extends StatelessWidget {
  const ContactPersonInfoLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadingInfoItem(),
            LoadingInfoItem(),
            LoadingInfoItem(),
          ],
        ),
      ),
    );
  }
}
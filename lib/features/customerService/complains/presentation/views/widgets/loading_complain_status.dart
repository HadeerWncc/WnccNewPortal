import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';

class LoadingComplainStatus extends StatelessWidget {
  const LoadingComplainStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomMarkedColorContainer(
            title: 'Statusss',
            color: Color.fromARGB(255, 5, 167, 65),
            bgColor: Color.fromARGB(255, 234, 245, 238),
          ),
        ],
      ),
    );
  }
}

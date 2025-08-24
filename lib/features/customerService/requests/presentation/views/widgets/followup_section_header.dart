import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';

class FollowUpSectionHeader extends StatelessWidget {
  const FollowUpSectionHeader({
    super.key,
    required this.requestName,
  });
  final String requestName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'follow-ups',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        CustomMarkedColorContainer(
          title: requestName,
          color: Colors.grey,
          bgColor: const Color.fromARGB(255, 241, 241, 241),
        ),
      ],
    );
  }
}

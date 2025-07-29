import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';

class FollowUpSectionHeader extends StatelessWidget {
  const FollowUpSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'follow-ups',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        CustomMarkedColorContainer(
          title: 'Inovice',
          color: Colors.grey,
          bgColor: Color.fromARGB(255, 241, 241, 241),
        ),
      ],
    );
  }
}

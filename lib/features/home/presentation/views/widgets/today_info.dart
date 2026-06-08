import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class TodayInfo extends StatelessWidget {
  const TodayInfo({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.solidCircle,
          size: 7, // Adjust size to make it look like a bullet point
          color: homeColor,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            color: homeColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

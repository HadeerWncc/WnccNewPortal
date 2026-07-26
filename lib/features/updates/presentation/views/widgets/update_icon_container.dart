import 'package:flutter/material.dart';

class UpdateIconContainer extends StatelessWidget {
  const UpdateIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white)),
      child: const Icon(
        Icons.circle_notifications_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

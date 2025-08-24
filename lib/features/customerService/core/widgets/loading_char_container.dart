import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCharContainer extends StatelessWidget {
  const LoadingCharContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xff1B85FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'H',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

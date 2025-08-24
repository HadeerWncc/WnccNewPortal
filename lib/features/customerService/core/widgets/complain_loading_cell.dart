import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTableCell extends StatelessWidget {
  const LoadingTableCell({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: 20,
          color: const Color.fromARGB(255, 205, 205, 205),
        ),
      ),
    );
  }
}

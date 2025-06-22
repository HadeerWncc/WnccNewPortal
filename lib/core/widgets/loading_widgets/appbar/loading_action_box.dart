import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingActionBox extends StatelessWidget {
  const LoadingActionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xffFEFBEA),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xffFEFBEA),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const LoadingAppbarImage(),
        ],
      ),
    );
  }
}

class LoadingAppbarImage extends StatelessWidget {
  const LoadingAppbarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xffFEFBEA),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

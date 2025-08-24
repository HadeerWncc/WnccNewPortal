import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_char_container.dart';

class LoadingSupportDetailsInfo extends StatelessWidget {
  const LoadingSupportDetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              const LoadingCharContainer(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 2),
                      const Icon(
                        Symbols.schedule,
                        color: Color.fromARGB(255, 83, 134, 223),
                        size: 16,
                        weight: 900,
                      ),
                      const SizedBox(width: 4),
                      Opacity(
                        opacity: .5,
                        child: Container(
                          width: 90,
                          height: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Opacity(
                    opacity: .5,
                    child: Container(
                      width: 200,
                      height: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MarkedText(
                child: 'Request delivery by hadeer',
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
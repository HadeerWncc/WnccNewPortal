import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/forwarded_section_header.dart';

class LoadingForwardedForSection extends StatelessWidget {
  const LoadingForwardedForSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
        child: Column(
          children: [
            const ForwardedSectionHeader(),
            const SizedBox(height: 15),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CustomCircelLetterContainer(
                        letter: 'H',
                        bgColor: kBtnColor,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 15,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 5),
                          Opacity(
                            opacity: .5,
                            child: Container(
                              width: 110,
                              height: 15,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Symbols.check,
                    color: Color.fromARGB(255, 168, 168, 169),
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}

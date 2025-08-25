import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/comp_followup_header.dart';

class LoadingComplainFollowupSection extends StatelessWidget {
  const LoadingComplainFollowupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromARGB(255, 180, 179, 179))),
        child: Column(
          children: [
            const CompSectionHeader(
              title: 'Follow_up',
              icon: Symbols.add_circle,
            ),
            const SizedBox(height: 15),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CustomCircelLetterContainer(
                        letter: 'H',
                        bgColor: Colors.redAccent,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 13,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 5),
                          Opacity(
                            opacity: .5,
                            child: Container(
                              width: 110,
                              height: 13,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 70,
                    height: 13,
                    color: Colors.white,
                  ),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
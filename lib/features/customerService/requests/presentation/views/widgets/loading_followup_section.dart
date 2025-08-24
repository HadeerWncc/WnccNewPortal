
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/followup_section_header.dart';

class LoadingFollowUpsection extends StatelessWidget {
  const LoadingFollowUpsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: const Color.fromARGB(255, 180, 179, 179))),
      child: Column(
        children: [
          const FollowUpSectionHeader(
            requestName: 'requestName',
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
    );
  }
}

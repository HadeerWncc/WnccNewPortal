import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_state.dart';

class FollowUpSectionBody extends StatelessWidget {
  const FollowUpSectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCircelLetterContainer(letter: 'A',bgColor: Colors.redAccent,),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Adminstrator'),
                Opacity(
                  opacity: .5,
                  child: Text('21/7/2025 4:31'),
                ),
              ],
            ),
          ],
        ),
        RequestState(),
      ],
    );
  }
}
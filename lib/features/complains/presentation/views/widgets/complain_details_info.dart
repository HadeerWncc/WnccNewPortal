import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_payer_info_section.dart';

class ComplainDetailsInfo extends StatelessWidget {
  const ComplainDetailsInfo({super.key, required this.complain});
  final ComplainDetailsEntity complain;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComplainPayerInfoSection(
          complain: complain,
        ),
        Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(10),
          height: 100,
          child: Text("${complain.description}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MarkedText(
              child:
                  '1 images uploaded',
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
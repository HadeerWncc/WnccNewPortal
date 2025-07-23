import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/payer_info_section.dart';

class RequestDetailsInfo extends StatelessWidget {
  const RequestDetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PayerInfoSection(),
        Container(
              // width: double.infinity,
              padding: const EdgeInsets.all(10),
              height: 100,
              child: const Text('//Comment'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MarkedText(
                  child: 'Request delivery by Email',
                ),
                SizedBox(width: 10),
              ],
            ),
      ],
    );
  }
}


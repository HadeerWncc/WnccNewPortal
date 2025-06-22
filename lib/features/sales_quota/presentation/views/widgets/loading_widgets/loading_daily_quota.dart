import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_place_holder_input.dart';

class LoadingDailyQuota extends StatelessWidget {
  const LoadingDailyQuota({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily Quota',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            LoadingPlaceHolderInput(),
            SizedBox(width: 10),
            LoadingPlaceHolderInput(),
            SizedBox(width: 10),
            LoadingPlaceHolderInput(),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

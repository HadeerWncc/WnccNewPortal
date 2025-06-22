import 'package:flutter/widgets.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/head_drawer_info_text.dart';

class DrawerHeaderInfo extends StatelessWidget {
  const DrawerHeaderInfo({
    super.key,
    required this.fullName,
    required this.email,
  });
  final String fullName;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        HeadDrawerInfoText(
          text: fullName,
        ),
        const SizedBox(height: 5),
        HeadDrawerInfoText(
          text: email,
        ),
      ],
    );
  }
}

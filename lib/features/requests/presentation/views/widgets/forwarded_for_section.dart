import 'package:flutter/material.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_section_body.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_section_header.dart';

class ForwardedForSection extends StatelessWidget {
  const ForwardedForSection({super.key, required this.forwardedUsers});
  final List<ForwardUser> forwardedUsers;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
      child: Column(
        children: [
          const ForwardedSectionHeader(),
          const SizedBox(height: 15),
          ForwardedSectionBody(
            forwardedList: forwardedUsers,
          ),
        ],
      ),
    );
  }
}

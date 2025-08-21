import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/comp_followup_header.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/comp_forward_body.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

class ComplainForwardSection extends StatelessWidget {
  const ComplainForwardSection({super.key, required this.forwardUsers});
  final List<ForwardUser> forwardUsers;
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
          CompSectionHeader(
            title: 'Forwarded Users',
            icon: Symbols.arrow_circle_up,
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          CompForwardBody(
            forwardedUsers: forwardUsers,
          ),
        ],
      ),
    );
  }
}

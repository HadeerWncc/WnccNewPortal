import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_state_container.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/custom_user_name_widget.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/user_info_item.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomUserNameWidget(),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoItem(
              title: user.position!,
              icon: Symbols.work_history,
            ),
            const SizedBox(height: 10),
            UserInfoItem(
              title: '${user.state}, ${user.city}',
              icon: Symbols.home,
            ),
            const SizedBox(height: 10),
            UserInfoItem(
              title: user.email!,
              icon: Symbols.alternate_email,
            ),
            const SizedBox(height: 10),
            CustomStateContainer(
              title: user.roles!.isNotEmpty? user.roles![0] : 'N/A',
              color: const Color.fromARGB(255, 32, 128, 207),
              bgColor: const Color.fromARGB(255, 225, 242, 255),
            ),
          ],
        ),
      ],
    );
  }
}

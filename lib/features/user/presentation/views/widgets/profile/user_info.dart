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
        CustomUserNameWidget(
          child: user.fullName ?? "N/A",
        ),
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
            SizedBox(
              height: 32,
              width: MediaQuery.of(context).size.width *.6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: user.roles?.length,
                itemBuilder: (context, index) {
                  
                  return CustomStateContainer(
                    title:  user.roles![index] ,
                    color: const Color.fromARGB(255, 32, 128, 207),
                    bgColor: const Color.fromARGB(255, 225, 242, 255),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}

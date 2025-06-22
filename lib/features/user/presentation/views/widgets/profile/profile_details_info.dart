import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_container_item.dart';

class ProfileDetailsInfo extends StatelessWidget {
  const ProfileDetailsInfo({
    super.key, required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        // runSpacing: 10,
        children: [
          ProfileContainerItem(
            title: user.id.toString(),
            subTitle: 'Code',
          ),
          ProfileContainerItem(
            title: user.department ?? 'N/A',
            subTitle: 'Department',
          ),
          ProfileContainerItem(
            title: user.position ?? 'N/A',
            subTitle: 'Position',
          ),
          ProfileContainerItem(
            title: user.phoneNumber ?? 'N/A',
            subTitle: 'Phone',
          ),
        ],
      ),
    );
  }
}

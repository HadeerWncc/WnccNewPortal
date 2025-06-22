import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/custom_profile_image.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_container_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/user_info.dart';

class ProfileUserInfoSection extends StatelessWidget {
  const ProfileUserInfoSection({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    DateFormat inputFormat = DateFormat('MMM d, y');
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomProfileImage(
                imageUrl: user.imageUrl,
              ),
              const SizedBox(width: 10),
              UserInfo(
                user: user,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ProfileContainerItem(
                title: (user.createdAt != '1/1/0001 12:00:00 AM')
                    ? inputFormat.parse(user.createdAt!).toString()
                    : "",
                subTitle: 'Created At',
              ),
              const SizedBox(width: 10),
              ProfileContainerItem(
                title: (user.createdAt != '1/1/0001 12:00:00 AM')
                    ? inputFormat.parse(user.createdAt!).toString()
                    : "",
                subTitle: 'Updated At',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButton(
                  contant: 'Back Home',
                  color: Colors.blue,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.homePath);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

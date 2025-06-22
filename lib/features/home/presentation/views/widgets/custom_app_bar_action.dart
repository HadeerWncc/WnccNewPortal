import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/shared_preferences.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_action_box.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_popup_menu_item.dart';

class CustomAppbarActions extends StatelessWidget {
  const CustomAppbarActions({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (value) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            GoRouter.of(context).push(AppRouter.profile);
          },
          value: "Profile",
          child: const CustomPopMenuItem(
            title: "Profile",
            icon: Icons.person,
          ),
        ),
        const PopupMenuItem(
          value: "Settings",
          child: CustomPopMenuItem(
            title: "Settings",
            icon: Icons.settings,
          ),
        ),
        PopupMenuItem(
          onTap: () {
            deleteToken();
            GoRouter.of(context).push(AppRouter.loginPath);
          },
          value: "Logout",
          child: const CustomPopMenuItem(
            title: "Logout",
            icon: Icons.exit_to_app,
          ),
        ),
      ],
      child: CustomActionBox(
        user: user,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_drawer_header.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/drawer_menu_list.dart';

class CustomMenusList extends StatelessWidget {
  const CustomMenusList({
    super.key,
    required this.user,
    required this.activeTab,
  });
  final UserModel user;
  final String activeTab;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomDrawerHeader(
            user: user,
          ),
          const Divider(),
          DrawerMenuList(activeTab: activeTab),
        ],
      ),
    );
  }
}

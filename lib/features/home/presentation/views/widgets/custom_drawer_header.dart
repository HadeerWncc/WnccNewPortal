import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/constants/links.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/drawer_header_info.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/drawer_personal_image.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? 200
                    : 70,
                color: Colors.white,
              ),
              SizedBox(
                width: double.infinity,
                height: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? 170
                    : 100,
              )
            ],
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? 90
              : 20,
          child: Center(
            child: Column(
              children: [
                DrawerPersonalImage(
                  image: (user.imageUrl == null)
                      ? personalImage
                      : "$baseUrl${user.imageUrl}",
                ),
                DrawerHeaderInfo(
                  fullName: user.fullName!,
                  email: user.email!,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

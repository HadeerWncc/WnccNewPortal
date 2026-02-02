import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_card_body.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_details_header.dart';

class ProfileChangePasswordSection extends StatelessWidget {
  const ProfileChangePasswordSection({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const ProfileDetailsHeader(
            title: 'Sign_in Method',
          ),
          const SizedBox(height: 10),
          const Divider(),
          ChangePasswordCardBody(
            userModel: userModel,
          )
        ],
      ),
    );
  }
}

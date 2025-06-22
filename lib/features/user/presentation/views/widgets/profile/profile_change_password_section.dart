import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_card_body.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_details_header.dart';

class ProfileChangePasswordSection extends StatelessWidget {
  const ProfileChangePasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          SizedBox(height: 10),
          ProfileDetailsHeader(
            title: 'Sign_in Method',
          ),
          SizedBox(height: 10),
          Divider(),
          ChangePasswordCardBody()
        ],
      ),
    );
  }
}







import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_change_password_section.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_user_details_section.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_user_info_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user, required this.states, required this.cities});
  final UserModel user;
  final List<String> states;
  final List<String> cities;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileUserInfoSection(
          user: user,
        ),
        const SizedBox(height: 20),
        ProfileUserDetailsSection(
          user: user,
          states: states,
          cities: cities,
        ),
        const SizedBox(height: 20),
        const ProfileChangePasswordSection(),
        const SizedBox(height: 20),
      ],
    );
  }
}

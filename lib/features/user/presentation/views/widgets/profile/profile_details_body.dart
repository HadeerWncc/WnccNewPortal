import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/dotted_divider.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_profile_details.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_details_info.dart';

class ProfileDetailsBody extends StatelessWidget {
  const ProfileDetailsBody({
    super.key,
    required this.user,
    required this.states,
    required this.cities,
  });
  final UserModel user;
  final List<String> states;
  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        children: [
          ProfileDetailsInfo(
            user: user,
          ),
          const SizedBox(height: 20),
          const DottedDivider(
            dotWidth: 2,
            space: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          ChangeProfileDetails(
            user: user,
            states: states,
            cities: cities,
          )
        ],
      ),
    );
  }
}

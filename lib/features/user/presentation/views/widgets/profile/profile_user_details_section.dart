import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_details_body.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/profile_details_header.dart';

class ProfileUserDetailsSection extends StatelessWidget {
  const ProfileUserDetailsSection(
      {super.key,
      required this.user,
      required this.states,
      required this.cities});
  final UserModel user;
  final List<String> states;
  final List<String> cities;
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
            title: 'Profile Details',
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 20),
          ProfileDetailsBody(
            user: user,
            states: states,
            cities: cities,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          // SizedBox(
          //   width: double.infinity,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       SizedBox(
          //         width: MediaQuery.of(context).size.width * 0.4,
          //         child: CustomButtonWithIcon(
          //           child: 'Save Changes',
          //           textColor: Colors.white,
          //           bgColor: const Color(0xffF8BE03),
          //           icon: Symbols.bookmarks,
          //           onHoverColor: const Color.fromARGB(255, 244, 204, 73),
          //           onTap: () {
          //             // Handle save changes
          //           },
          //         ),
          //       ),
          //       const SizedBox(width: 13),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

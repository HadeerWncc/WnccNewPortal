import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_change_personal_info_form.dart';

class ChangePersonalInfoBody extends StatelessWidget {
  const ChangePersonalInfoBody(
      {super.key,
      required this.user,
      required this.states,
      required this.cities});
  final UserModel user;
  final List<String> states;
  final List<String> cities;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const FormHeading(
              title: 'Personal Information',
              subTitle: 'Change your personal information',
            ),
            const SizedBox(height: 20),
            CustomChangePersonalInfoForm(
              user: user,
              states: states,
              cities: cities,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

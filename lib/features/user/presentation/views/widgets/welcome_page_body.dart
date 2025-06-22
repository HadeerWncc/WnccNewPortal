import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_checkbox_configuration.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(child: WelcomeText()),
          FormHeading(
            title: 'Welcome to Wadi Elnile.',
            subTitle: '',
          ),
          SizedBox(height: 20),
          CustomCheckBoxConfiguration()
        ],
      ),
    );
  }
}

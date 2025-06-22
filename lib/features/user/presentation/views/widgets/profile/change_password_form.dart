import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Old Password',
            secure: true,
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'New Password',
            secure: true,
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Confirm Password',
            secure: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: CustomButtonWithIcon(
              child: 'Change Password',
               bgColor: const Color.fromARGB(255, 32, 124, 32),
              textColor:  Colors.white,
              onHoverColor: const Color.fromARGB(255, 2, 172, 2),
              icon: Symbols.bookmarks,
              onTap: () {
                // Handle change password
              },
            ),
          ),
        ],
      );
  }
}
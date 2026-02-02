import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class AddUpdateActions extends StatelessWidget {
  const AddUpdateActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButtonWithIcon(
          child: 'Clear',
          textColor: Colors.white,
          bgColor: const Color(0xff1a2a58),
          // icon: Icons.send,
          onHoverColor: const Color.fromARGB(255, 150, 150, 150),
          onTap: () {},
        ),
        const SizedBox(width: 20),
        CustomButtonWithIcon(
          child: 'Send',
          textColor: const Color(0xff1a2a58),
          bgColor: Colors.white,
          icon: Icons.send,
          onHoverColor: const Color.fromARGB(255, 150, 150, 150),
          onTap: () {},
        )
      ],
    );
  }
}

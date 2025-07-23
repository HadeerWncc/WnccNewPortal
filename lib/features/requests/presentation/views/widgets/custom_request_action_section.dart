import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class CustomRequestActionSection extends StatelessWidget {
  const CustomRequestActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonWithIcon(
            child: 'Forward',
            textColor: Colors.black,
            bgColor: Color(0xffF9F9F9),
            icon: Symbols.forward,
            onHoverColor: Color.fromARGB(255, 207, 207, 207),
          ),
          SizedBox(width: 10),
           CustomButtonWithIcon(
            child: 'Reject All',
            textColor: Colors.black,
            bgColor: Color(0xffF9F9F9),
            icon: Symbols.cancel,
            onHoverColor: Color.fromARGB(255, 207, 207, 207),
          ),
          SizedBox(width: 10),
           CustomButtonWithIcon(
            child: 'Approve All',
            textColor: Colors.black,
            bgColor: Color(0xffF9F9F9),
            icon: Symbols.inventory,
            onHoverColor: Color.fromARGB(255, 207, 207, 207),
          ),
        ],
      ),
    );
  }
}
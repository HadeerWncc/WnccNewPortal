import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class BookingPriceActionButtons extends StatelessWidget {
  const BookingPriceActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CustomButtonWithIcon(
            child: 'Reset',
            textColor: Colors.black,
            bgColor: Color.fromARGB(255, 234, 234, 235),
            icon: Symbols.restart_alt,
            onHoverColor: Color.fromARGB(255, 170, 170, 172),
          ),
          const SizedBox(width: 10),
          CustomButtonWithIcon(
            child: 'Distribute',
            textColor: Colors.white,
            bgColor: kBtnColor,
            icon: Symbols.app_registration,
            onHoverColor: const Color.fromARGB(255, 20, 96, 37),
            onTap: () {
              // tryToDistribute(context);
            },
          )
        ],
      ),
    );
  }
}
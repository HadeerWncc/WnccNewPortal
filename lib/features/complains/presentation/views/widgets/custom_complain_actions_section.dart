import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class CustomComplainActionsSection extends StatelessWidget {
  const CustomComplainActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomButtonWithIcon(
                child: 'Forward',
                textColor: Colors.black,
                bgColor: const Color(0xffF9F9F9),
                icon: Symbols.forward,
                onHoverColor: const Color.fromARGB(255, 207, 207, 207),
                onTap: () {
                  // forwardPopUp(context, requestId: requestId);
                },
              ),
              const SizedBox(width: 10),
              CustomButtonWithIcon(
                child: 'Follow_up',
                textColor: Colors.black,
                bgColor: const Color(0xffF9F9F9),
                icon: Symbols.inventory,
                onHoverColor: const Color.fromARGB(255, 207, 207, 207),
                onTap: () {
                  
                },
              ),
            ],
          ),
          CustomButtonWithIcon(
            child: 'Close',
            textColor: Colors.white,
            bgColor: const Color(0xff13C855),
            icon: Symbols.task_alt,
            onHoverColor: const Color.fromARGB(255, 12, 132, 56),
            onTap: () {
              
              
            },
          ),
        ],
      ),
    );
  }
}
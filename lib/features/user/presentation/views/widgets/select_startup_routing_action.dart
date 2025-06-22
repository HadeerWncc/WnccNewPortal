import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class SelectStartupRoutingAction extends StatelessWidget {
  const SelectStartupRoutingAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWithIcon(
          onTap: () {
            GoRouter.of(context).push(AppRouter.thanksPagePath);
          },
          child: 'Skip',
          bgColor: const Color(0xffF1F1F3),
          textColor: Colors.black,
          icon: Symbols.swipe_up,
          onHoverColor: const Color.fromARGB(255, 179, 179, 179),
        ),
        const SizedBox(width: 13),
        CustomButtonWithIcon(
          onTap: () {
            // GoRouter.of(context).push(AppRouter.thanksPagePath);
          },
          child: 'Submit',
          bgColor: const Color(0xffE9F3FF),
          textColor: Colors.blueAccent,
          icon: Symbols.done_all,
          onHoverColor: kBtnColor,
        ),
      ],
    );
  }
}

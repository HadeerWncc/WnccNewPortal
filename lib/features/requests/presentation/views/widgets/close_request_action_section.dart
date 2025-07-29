import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class CloseRequestActionSection extends StatelessWidget {
  const CloseRequestActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButtonWithIcon(
          child: 'Close',
          textColor: Colors.white,
          bgColor: Color(0xff13C855),
          icon: Symbols.task_alt,
          onHoverColor: Color.fromARGB(255, 12, 132, 56),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

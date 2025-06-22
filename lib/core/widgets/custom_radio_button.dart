import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .05,
      height: MediaQuery.of(context).size.width * .05,
      decoration: BoxDecoration(
        color: active ? kBtnColor : const Color.fromARGB(255, 230, 230, 230),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .025,
          height: MediaQuery.of(context).size.width * .025,
          decoration: BoxDecoration(
            color: active
                ? Colors.white
                : const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

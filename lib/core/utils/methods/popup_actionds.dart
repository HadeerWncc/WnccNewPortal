import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

List<Widget> popUpActions(BuildContext context,
    {required String submitBtnName, required Function() onSubmit}) {
  return [
    CustomButton(
      contant: 'Discard',
      color: kHintColor,
      onTap: () {
        GoRouter.of(context).pop();
      },
    ),
    SizedBox(
      width: MediaQuery.of(context).size.width * .3,
      child: CustomButtonWithIcon(
        child: submitBtnName,
        textColor: Colors.white,
        bgColor: kBtnColor,
        icon: submitIcon,
        onHoverColor: const Color.fromARGB(255, 17, 82, 157),
        onTap: onSubmit,
      ),
    ),
  ];
}

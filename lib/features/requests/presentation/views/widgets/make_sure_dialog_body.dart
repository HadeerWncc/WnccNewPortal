import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';

class MakeSureDialogBody extends StatelessWidget {
  const MakeSureDialogBody({
    super.key,
    required this.contentText,
    required this.submitText,
    required this.onSubmit,
  });
  final String contentText;
  final String submitText;
  final Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          attentionIcon,
          size: 70,
          color: Colors.amber,
        ),
        const SizedBox(height: 15),
        const Text(
          'Are you sure?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        Text(contentText),
        const SizedBox(height: 25),
        Row(
          children: [
            CustomButton(
              contant: submitText,
              color: const Color(0xff2C87DA),
              onTap: onSubmit,
            ),
            const SizedBox(width: 10),
            CustomButton(
              contant: 'Cancel',
              color: const Color(0xffC42E2F),
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }
}

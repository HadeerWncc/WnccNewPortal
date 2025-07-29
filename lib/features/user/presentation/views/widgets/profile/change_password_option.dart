import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';

class ResetPasswordOption extends StatelessWidget {
  const ResetPasswordOption({
    super.key,
    required this.onTap,
  });
  final Function(bool) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '***********',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: CustomButton(
            contant: 'Reset Password',
            color: const Color(0xffFAF9F7),
            textColor: const Color.fromARGB(255, 39, 39, 39),
            onTap: () {
              onTap(true);
            },
          ),
        )
      ],
    );
  }
}

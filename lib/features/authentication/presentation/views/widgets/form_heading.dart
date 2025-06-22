import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class FormHeading extends StatelessWidget {
  const FormHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.link = '',
    this.gosTo,
  });
  final String title;
  final String subTitle;
  final String link;
  final String? gosTo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 13,
                color: kHintColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (gosTo != null) {
                  GoRouter.of(context).push(gosTo!);
                }
              },
              child: Text(
                link,
                style: const TextStyle(
                  fontSize: 13,
                  color: kBtnColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

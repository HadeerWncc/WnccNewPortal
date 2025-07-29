import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class LoadingBtnWhenGet extends StatelessWidget {
  const LoadingBtnWhenGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kloadingColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      height: 50,
    );
  }
}

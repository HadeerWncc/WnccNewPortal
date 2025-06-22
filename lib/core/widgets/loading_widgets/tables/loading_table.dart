import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class LoadingTable extends StatelessWidget {
  const LoadingTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      color: kloadingColor,
    );
  }
}

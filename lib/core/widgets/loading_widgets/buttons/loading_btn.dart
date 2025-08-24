import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class LoadingBtn extends StatelessWidget {
  const LoadingBtn({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CustomButtonWithIcon(
        child: title,
        textColor: Colors.white,
        bgColor: const Color(0xff13C855),
        icon: Symbols.task_alt,
        onHoverColor: const Color.fromARGB(255, 12, 132, 56),
        onTap: null,
      ),
    );
  }
}

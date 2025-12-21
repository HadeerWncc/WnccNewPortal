import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class CustomPriorityActionsWidget extends StatelessWidget {
  const CustomPriorityActionsWidget({super.key, required this.itemBuilder});
  final List<PopupMenuEntry<String>> Function(BuildContext) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Symbols.window,
        color: kMainColor,
        weight: 900,
      ),
      position: PopupMenuPosition.under,
      onSelected: (value) {},
      itemBuilder: itemBuilder,
    );
  }
}

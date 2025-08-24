import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class PopUpHeadingTitle extends StatelessWidget {
  const PopUpHeadingTitle({
    super.key,
    required this.headingText,
  });
  final String headingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(headingText),
              ),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Symbols.close,
                    size: 20,
                    weight: 900,
                  ))
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

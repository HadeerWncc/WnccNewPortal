import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomVisabilityIcon extends StatefulWidget {
  const CustomVisabilityIcon({
    super.key,
  });

  @override
  State<CustomVisabilityIcon> createState() => _CustomVisabilityIconState();
}

class _CustomVisabilityIconState extends State<CustomVisabilityIcon> {
  bool visable = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        visable = !visable;
        setState(() {});
      },
      icon: visable
          ? const Icon(Symbols.visibility)
          : const Opacity(opacity: .5, child: Icon(Symbols.visibility_off)),
    );
  }
}

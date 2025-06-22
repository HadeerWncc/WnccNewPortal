import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SelectRoutingItemIcon extends StatelessWidget {
  const SelectRoutingItemIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .12,
      height: MediaQuery.of(context).size.width * .12,
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(5)),
      child: const Icon(
        Symbols.task_alt,
        weight: 900,
        size: 22,
        color: Color.fromARGB(255, 112, 112, 112),
      ),
    );
  }
}

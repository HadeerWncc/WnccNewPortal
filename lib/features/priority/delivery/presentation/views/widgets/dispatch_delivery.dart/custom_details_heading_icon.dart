import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomDetailsHeadingIcon extends StatelessWidget {
  const CustomDetailsHeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1D82FF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Icon(
          Symbols.local_shipping,
          color: Colors.white,
          size: 27,
        ),
      ),
    );
  }
}

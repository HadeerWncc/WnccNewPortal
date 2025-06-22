import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double dotWidth;
  final double space;
  final Color color;

  const DottedDivider({
    this.dotWidth = 4,
    this.space = 4,
    this.color = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int count = (constraints.maxWidth / (dotWidth + space)).floor();
        return Row(
          spacing: space,
          children: List.generate(count, (_) {
            return Container(
              width: dotWidth,
              height: 1,
              color: color,
            );
          }),
        );
      },
    );
  }
}

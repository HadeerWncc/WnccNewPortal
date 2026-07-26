import 'package:flutter/material.dart';

class HomeUserCard extends StatelessWidget {
  const HomeUserCard({
    super.key,
    required this.child,
    this.width,
    required this.gradient,
    this.margin,
    this.height,
    this.shadow,
  });

  final Widget child;
  final double? width;
  final List<Color> gradient;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final bool? shadow;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: (shadow == false)
              ? Border.all(color: Color.fromARGB(255, 1, 38, 138))
              : null,
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: gradient),
          boxShadow: (shadow == true || shadow == null)
              ? const [
                  BoxShadow(
                    color: Color.fromARGB(255, 130, 130, 130),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: child);
  }
}

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProfileContainerItem extends StatelessWidget {
  const ProfileContainerItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 211, 211, 211),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Symbols.overview,
                  color: Color.fromARGB(255, 22, 110, 182),
                  size: 19,
                  weight: 900,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: .4,
              child: Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

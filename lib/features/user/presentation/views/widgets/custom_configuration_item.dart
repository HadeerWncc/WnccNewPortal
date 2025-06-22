import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomConfigurationItem extends StatelessWidget {
  const CustomConfigurationItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.selected,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final bool selected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        color: selected
            ? const Color.fromARGB(255, 76, 148, 235)
            : const Color.fromARGB(255, 210, 208, 208),
        borderPadding: EdgeInsets.zero,
        radius: const Radius.circular(8),
        borderType: BorderType.RRect,
        strokeWidth: 1.3,
        dashPattern: const [2, 2], // lift is dash length, right is space length

        child: Container(
          padding: const EdgeInsets.all(20),
          color: selected ? const Color(0xffE9F3FF) : Colors.white,
          child: Row(
            children: [
              Icon(
                // FontAwesomeIcons.gear,
                Symbols.settings,
                color: selected
                    ? const Color.fromARGB(255, 76, 148, 235)
                    : Colors.black,
                weight: 1000,
              ),
              const SizedBox(
                width: 13,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Opacity(
                      opacity: .4,
                      child: Text(
                        subTitle,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

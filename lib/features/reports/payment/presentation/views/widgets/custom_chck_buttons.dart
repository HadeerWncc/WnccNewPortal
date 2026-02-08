
import 'package:flutter/material.dart';

class CustomChckButtons extends StatelessWidget {
  const CustomChckButtons({
    super.key,
    this.onTap,
    required this.buttons,
    required this.activeTab,
  });
  final List<String> buttons;
  final int activeTab;
  // final bool isSelected = false;
  final Function(String value)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 222, 221, 221)),
        color: Colors.white,
      ),
      child: SizedBox(
        height: 40,
        // width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onTap?.call(buttons[index]);
              },
              child: Container(
                // width: buttonWidth,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: index == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        )
                      : index == buttons.length - 1
                          ? const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          : null,
                  border: index == activeTab
                      ? Border.all(color: const Color(0xff447a46))
                      : null,
                  color: index == activeTab
                      ? const Color(0xfff0f9f1)
                      : const Color(0xfff7faf8),
                ),
                child: Center(
                  child: Text(
                    buttons[index],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: index == activeTab
                          ? Colors.black
                          : const Color.fromARGB(255, 81, 80, 80),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

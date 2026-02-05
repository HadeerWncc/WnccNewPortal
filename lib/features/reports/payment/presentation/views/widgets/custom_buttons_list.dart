import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_button_item.dart';

class CustomButtonsList extends StatelessWidget {
  const CustomButtonsList({
    super.key,
    required this.buttons,
    required this.activeTab,
    this.onTap,
  });
  final List<String> buttons;
  final int activeTab;
  final Function(String value)? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return CustomButtonItem(
            onSelected: (value) {
              onTap?.call(value);
            },
            buttonWidth: MediaQuery.of(context).size.width / buttons.length,
            isSelected: index == activeTab,
            title: buttons[index],
            borderRadius: index == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : index == buttons.length - 1
                    ? const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : null,
          );
        },
      ),
    );
  }
}

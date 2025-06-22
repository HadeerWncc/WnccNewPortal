import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_radio_button.dart';

class CustomSelectProductCategoryRadioButton extends StatelessWidget {
  const CustomSelectProductCategoryRadioButton({
    super.key,
    required this.selectedCategory,
    this.isSelected = false,
    this.onTap,
  });
  final String selectedCategory;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomRadioButton(active: isSelected),
          const SizedBox(width: 5),
          Text(
            selectedCategory,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

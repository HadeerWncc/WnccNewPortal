import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_select_product_category_radio_button.dart';

class LoadingSelectProductRadioBtn extends StatelessWidget {
  const LoadingSelectProductRadioBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "All",
            isSelected: true,
          ),
          SizedBox(width: 20),
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "Bags",
            isSelected: false,
          ),
          SizedBox(width: 20),
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "Bulk",
            isSelected: false,
          )
        ],
      ),
    );
  }
}
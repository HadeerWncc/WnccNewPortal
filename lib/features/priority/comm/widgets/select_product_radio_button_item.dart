import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_select_product_category_radio_button.dart';

class SelectProductRadioButtonItem extends StatefulWidget {
  const SelectProductRadioButtonItem({
    super.key,
    required this.onChange,
  });
  final Function(String) onChange;
  @override
  State<SelectProductRadioButtonItem> createState() =>
      _SelectProductRadioButtonItemState();
}

class _SelectProductRadioButtonItemState
    extends State<SelectProductRadioButtonItem> {
  String activeTab = "All";
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * .6,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "All",
            isSelected: activeTab == "All",
            onTap: () {
              setState(() {
                activeTab = "All";
                widget.onChange(activeTab);
              });
            },
          ),
          const SizedBox(width: 20),
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "Bags",
            isSelected: activeTab == "Bags",
            onTap: () {
              setState(() {
                activeTab = "Bags";
                widget.onChange(activeTab);
              });
            },
          ),
          const SizedBox(width: 20),
          CustomSelectProductCategoryRadioButton(
            selectedCategory: "Bulk",
            isSelected: activeTab == "Bulk",
            onTap: () {
              setState(() {
                activeTab = "Bulk";
                widget.onChange(activeTab);
              });
            },
          )
        ],
      ),
    );
  }
}

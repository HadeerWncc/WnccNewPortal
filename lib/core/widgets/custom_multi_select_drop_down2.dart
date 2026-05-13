import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomMultiSelectDropDown2 extends StatefulWidget {
  const CustomMultiSelectDropDown2({
    super.key,
    required this.products,
    required this.selectedProducts,
    this.onChanged,
  });

  final List<String> products;
  final List<String> selectedProducts;
  final Function(List<String>)? onChanged;

  @override
  State<CustomMultiSelectDropDown2> createState() =>
      _CustomMultiSelectDropDown2State();
}

class _CustomMultiSelectDropDown2State
    extends State<CustomMultiSelectDropDown2> {
  final GlobalKey<DropdownSearchState<String>> _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final List<String> productsName = widget.products
    //     .map((r) => r.materialName)
    //     .where((name) => name.isNotEmpty)
    //     .toList();

    return DropdownSearch<String>.multiSelection(
      key: _dropdownKey,
      items: widget.products,
      selectedItems: widget.selectedProducts,
      dropdownBuilder: (context, selectedItems) {
        return Text(
          widget.selectedProducts.isEmpty
              ? "Select Materials"
              : "${widget.selectedProducts.length} Materials selected",
          style: const TextStyle(color: Colors.black),
        );
      },
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: true,
        showSelectedItems: false,
        selectionWidget: (context, item, isSelected) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? Colors.green : Colors.grey.shade400,
              size: 22,
            ),
          );
        },
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(
              item,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          );
        },
      ),
      onChanged: widget.onChanged,
    );
  }
}

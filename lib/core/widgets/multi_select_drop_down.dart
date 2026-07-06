import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/region_with_area.dart';

class MultiSelectDropDown extends StatefulWidget {
  const MultiSelectDropDown({
    super.key,
    required this.items,
    required this.selectedItems,
    this.onChanged,
  });

  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>)? onChanged;

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  final GlobalKey<DropdownSearchState<String>> _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final List<String> regionNames = widget.items
    //     .map((r) => r.regionName)
    //     .where((name) => name.isNotEmpty)
    //     .toList();

    return DropdownSearch<String>.multiSelection(
      key: _dropdownKey,
      items: widget.items,
      selectedItems: widget.selectedItems,
      dropdownBuilder: (context, selectedItems) {
        return Text(
          widget.selectedItems.isEmpty
              ? "Select items"
              : "${widget.selectedItems.length} items selected",
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

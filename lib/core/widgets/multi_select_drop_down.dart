import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MultiSelectDropDown extends StatefulWidget {
  const MultiSelectDropDown(
      {super.key, required this.cities, required this.selectedCities});
  final List<String> cities;
  final List<String> selectedCities;
  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  List<String> selectedCities = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCities = widget.selectedCities;
  }

  final GlobalKey<DropdownSearchState<String>> _dropdownKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      key: _dropdownKey,
      items: widget.cities,
      selectedItems: selectedCities,
      dropdownBuilder: (context, selectedItems) {
        return Text(
          selectedItems.isEmpty
              ? "Select items"
              : "${selectedItems.length} items selected",
          style: const TextStyle(color: Colors.black),
        );
      },
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: true,
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(item, style: const TextStyle(color: Colors.black)),
          );
        },
        containerBuilder: (context, popupWidget) {
          return Column(
            children: [
              ListTile(
                title: const Text("Select All",
                    style: TextStyle(color: Colors.blue)),
                trailing: Checkbox(
                  value: selectedCities.length == widget.cities.length,
                  onChanged: (val) {
                    if (val == true) {
                      _dropdownKey.currentState?.popupSelectAllItems();
                    } else {
                      _dropdownKey.currentState?.popupDeselectAllItems();
                    }
                  },
                ),
              ),
              const Divider(),
              Expanded(child: popupWidget),
            ],
          );
        },
      ),
      onChanged: (values) {
        setState(() {
          selectedCities = values;
        });
      },
    );
  }
}

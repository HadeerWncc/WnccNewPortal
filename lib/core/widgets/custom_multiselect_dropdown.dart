import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomMultiSelectDropDown extends StatefulWidget {
  const CustomMultiSelectDropDown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.title,
    this.width,
  });

  final String? selectedValue;
  final List<String> items;
  final Function(List<String>) onChanged;
  final String title;
  final double? width;

  @override
  State<CustomMultiSelectDropDown> createState() =>
      _CustomMultiSelectDropDownState();
}

class _CustomMultiSelectDropDownState extends State<CustomMultiSelectDropDown> {
  List<String> selectedItems = [];
  String multiChoiceTitle = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    multiChoiceTitle = widget.selectedValue??"";
  }

  @override
  Widget build(BuildContext context) {
    double defaultWidth =
        MediaQuery.of(context).size.width * 1 - (kHorizontalPadding * 2);
    return SizedBox(
      width: widget.width != null
          ? MediaQuery.of(context).size.width * .5
          : defaultWidth,
      child: DropdownButtonFormField<String>(
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: inputBorder(),
          focusedBorder: customfocusedBorder(),
          fillColor: const Color(0xffF9F9F9),
          filled: true,
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 83, 83, 83),
          ),
        ),
        value: widget.selectedValue,
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: selectedItems.contains(item)
                      ? Container(
                          color: const Color.fromARGB(255, 204, 215, 235),
                          // width: 55,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            item,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis, fontSize: 12),
                          ),
                        )
                      : SizedBox(
                          // width: 55,
                          child: Text(
                            item,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis, fontSize: 12),
                          ),
                        ),
                ))
            .toList(),
        onChanged: (value) {
          if (selectedItems.contains(value)) {
            selectedItems.remove(value.toString());
          } else {
            selectedItems.add(value.toString());
          }
          for (var item in selectedItems) {
            multiChoiceTitle += " $item";
          }
          setState(() {});
          widget.onChanged(selectedItems);
        },
      ),
    );
  }
}

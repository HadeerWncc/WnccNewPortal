import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.selectedValue,
    required this.items,
    this.onChanged,
    this.title,
    this.width,
    this.hintText,
  });

  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String? title;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    double defaultWidth =
        MediaQuery.of(context).size.width * 1 - (kHorizontalPadding * 2);

    return SizedBox(
      width: width ?? defaultWidth,
      child: DropdownSearch<String>(
        selectedItem: items.contains(selectedValue)
            ? selectedValue
            : null,
        items: items,
        dropdownBuilder: (context, selectedItem) {
          // عرض الاسم فقط
          if (selectedItem == null) return Text(hintText ?? "");
          return Text(selectedItem.split('|').first,
              style: const TextStyle(
                  fontSize: 9, fontWeight: FontWeight.bold));
        },
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: "Search",
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: inputBorder(),
              focusedBorder: customfocusedBorder(),
            ),
          ),
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              title: RichText(
                text: TextSpan(
                  text: item.split('|').first,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                      overflow: TextOverflow.ellipsis),
                  children: [
                    TextSpan(
                      text: item.contains('|') ? item.split('|').last : '',
                      style: const TextStyle(
                        color: Colors.transparent,
                        fontSize: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 83, 83, 83),
              fontSize: 12,
            ),
            enabledBorder: inputBorder(),
            focusedBorder: customfocusedBorder(),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        onChanged: onChanged,
        filterFn: (item, filter) {
          final parts = item.split('|');
          final name = parts.first.toLowerCase();
          final id = parts.length > 1 ? parts[1].toLowerCase() : '';
          final f = filter.toLowerCase();
          return name.contains(f) || id.contains(f);
        },
      ),
    );
  }
}
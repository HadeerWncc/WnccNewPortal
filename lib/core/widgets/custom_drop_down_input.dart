import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.selectedValue,
    required this.items,
    this.onChanged,
    required this.title,
    this.width,
  });

  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double defaultWidth =
        MediaQuery.of(context).size.width * 1 - (kHorizontalPadding * 2);
    return SizedBox(
      width:
          width != null ? MediaQuery.of(context).size.width * .5 : defaultWidth,
      child: DropdownButtonFormField<String>(
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: inputBorder(),
          focusedBorder: customfocusedBorder(),
          fillColor: const Color(0xffF9F9F9),
          filled: true,
          labelText: title,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 83, 83, 83),
          ),
        ),
        value: selectedValue,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: SizedBox(
                      // width: 55,
                      child: Text(
                    item,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, fontSize: 12),
                  )),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}

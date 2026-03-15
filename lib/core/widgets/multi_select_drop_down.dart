import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';

class MultiSelectDropDown extends StatefulWidget {
  const MultiSelectDropDown({
    super.key,
    required this.cities,
    required this.selectedCities,
    this.onChanged,
  });

  final List<DispatchRegion> cities;
  final List<String> selectedCities;
  final Function(List<String>)? onChanged;

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  final GlobalKey<DropdownSearchState<String>> _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final processedRegions = widget.cities.map((r) {
      String area = r.areaName ?? "Others";

      if (area == "Coastal") {
        area = "Delta";
      }

      return {
        'regionName': r.regionName ?? "",
        'areaName': area,
      };
    }).toList();

    processedRegions.sort(
        (a, b) => (a['areaName'] as String).compareTo(b['areaName'] as String));

    final List<String> sortedNames =
        processedRegions.map((e) => e['regionName'] as String).toList();

    return DropdownSearch<String>.multiSelection(
      key: _dropdownKey,
      items: sortedNames,
      selectedItems: widget.selectedCities,
      dropdownBuilder: (context, selectedItems) {
        return Text(
          widget.selectedCities.isEmpty
              ? "Select items"
              : "${widget.selectedCities.length} items selected",
          style: const TextStyle(color: Colors.black),
        );
      },
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: true,
        showSelectedItems: false,
        
        // 1. تخصيص الـ Checkbox الافتراضي ليكون في المكان والسطر المظبوط
        selectionWidget: (context, item, isSelected) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0), // مسافة من جهة اليسار
            child: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? Colors.green : Colors.grey.shade400,
              size: 22,
            ),
          );
        },

        // 2. تعديل الـ itemBuilder ليعرض النص فقط بجانب الـ selectionWidget
        itemBuilder: (context, item, isSelected) {
          final currentData = processedRegions.firstWhere((r) => r['regionName'] == item);
          final String currentArea = currentData['areaName'] as String;
          int currentIndex = sortedNames.indexOf(item);

          bool isFirstInGroup = false;
          if (currentIndex == 0) {
            isFirstInGroup = true;
          } else {
            final prevArea = processedRegions[currentIndex - 1]['areaName'] as String;
            if (prevArea != currentArea) {
              isFirstInGroup = true;
            }
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (isFirstInGroup) ...[
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //     color: Colors.grey.shade100,
              //     child: Text(
              //       currentArea,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 14,
              //         color: Color(0xFF2D5321),
              //       ),
              //     ),
              //   ),
              //   const Divider(height: 1),
              // ],
              // هنا نعرض النص فقط، والمكتبة ستضع الـ selectionWidget بجانبه تلقائياً
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          );
        },
      ),
      onChanged: widget.onChanged,
    );
  
  
  }
}

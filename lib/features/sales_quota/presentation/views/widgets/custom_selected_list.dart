import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_select_box_item.dart';

class CustomSelectedList extends StatefulWidget {
  const CustomSelectedList({
    super.key,
    required this.selectedItem,
  });

  final void Function(String value) selectedItem;

  @override
  State<CustomSelectedList> createState() => _CustomSelectedListState();
}

class _CustomSelectedListState extends State<CustomSelectedList> {
  bool selectedBags = true;
  bool selectedBulk = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSelectBoxItem(
          selected: selectedBags,
          onTap: () {
            setState(() {
              selectedBags = true;
              selectedBulk = false;
              widget.selectedItem('Bags');
            });
          },
          title: 'Bags Quota (0)',
        ),
        const SizedBox(width: 10),
        CustomSelectBoxItem(
          onTap: () {
            setState(() {
              selectedBags = false;
              selectedBulk = true;
              widget.selectedItem('Bulk');
            });
          },
          selected: selectedBulk,
          title: 'Bulk Quota (0)',
        ),
      ],
    );
  }
}

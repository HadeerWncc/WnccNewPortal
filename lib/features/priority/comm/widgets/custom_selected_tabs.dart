import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/selected_tab_item.dart';

class CustemSelectedTabs extends StatefulWidget {
  const CustemSelectedTabs({
    super.key,
    this.onChangeTab,
  });
  final Function(String)? onChangeTab;

  @override
  State<CustemSelectedTabs> createState() => _CustemSelectedTabsState();
}

class _CustemSelectedTabsState extends State<CustemSelectedTabs> {
  String selectedTab = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectedTabItem(
            title: 'Pending',
            active: selectedTab == 'Pending',
            onTap: () {
              setState(() {
                selectedTab = 'Pending';
                widget.onChangeTab?.call(selectedTab);
              });
            },
          ),
          SelectedTabItem(
            title: 'Priority',
            active: selectedTab == 'Priority',
            onTap: () {
              setState(() {
                selectedTab = 'Priority';
                widget.onChangeTab?.call(selectedTab);
              });
            },
          ),
          SelectedTabItem(
            title: 'Dispatched',
            active: selectedTab == 'Dispatched',
            onTap: () {
              setState(() {
                selectedTab = 'Dispatched';
                widget.onChangeTab?.call(selectedTab);
              });
            },
          ),
        ],
      ),
    );
  }
}

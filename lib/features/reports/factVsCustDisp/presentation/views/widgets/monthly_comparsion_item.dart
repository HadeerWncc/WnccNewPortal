import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/utils/methods/get_month_until.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/shipment_break_down_section.dart';

class MonthlyCompersionItem extends StatefulWidget {
  const MonthlyCompersionItem({
    super.key,
    required this.comaparingItem,
    required this.months,
    required this.year,
    this.onMonthChange,
    this.borderColor = Colors.grey,
  });

  final List<ComparingEntityItem> comaparingItem;
  final List<Map<int, String>> months;
  final int year;
  final Function(int)? onMonthChange;
  final Color borderColor;

  @override
  State<MonthlyCompersionItem> createState() => _MonthlyCompersionItemState();
}

class _MonthlyCompersionItemState extends State<MonthlyCompersionItem> {
  int month = 1;
  ComparingEntityItem comparsionItem = ComparingEntityItem(
      year: 0, month: 0, bags: 0, bulk: 0, export: 0, clincker: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    month = widget.months.map((m) => m.keys.first).toList()[0];
    comparsionItem = widget.comaparingItem[month];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: widget.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: CustomDropDownInput(
                  selectedValue:
                      DateFormat("MMMM").format(DateTime(widget.year, month)),
                  items: widget.months.map((m) => m.values.first).toList(),
                  onChanged: (value) {
                    month = getIndexOfMonth(value ?? 'January',
                        widget.months.map((m) => m.values.first).toList());
                    comparsionItem = widget.comaparingItem[month - 1];
                    widget.onMonthChange?.call(month);
                    setState(() {});
                  },
                ),
              ),
              MarkedText(
                child: '${widget.year}',
                color: const Color(0xff1b84ff),
                textColor: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 13),
          ShipmentBreakDownSection(
            comaparingItem: comparsionItem,
          )
        ],
      ),
    );
  }
}

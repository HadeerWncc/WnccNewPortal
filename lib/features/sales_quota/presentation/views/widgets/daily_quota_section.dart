import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class DailyQuotaSection extends StatefulWidget {
  const DailyQuotaSection({super.key, required this.totalsControllers});
  final Map<String, TextEditingController> totalsControllers;
  @override
  State<DailyQuotaSection> createState() => _DailyQuotaSectionState();
}

class _DailyQuotaSectionState extends State<DailyQuotaSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Quota',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            CustomPlaceholderInput(
              width: MediaQuery.of(context).size.width * .25,
              controller: widget.totalsControllers['totalQuota']!,
              labelText: 'Total Quota',
              enable: false,
            ),
            const SizedBox(width: 10),
            CustomPlaceholderInput(
              onChanged: (p0) {
                calculateTotalQuota();
              },
              width: MediaQuery.of(context).size.width * .25,
              controller: widget.totalsControllers['totalBags']!,
              labelText: 'Total Bags',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(width: 10),
            CustomPlaceholderInput(
              onChanged: (p0) {
                calculateTotalQuota();
              },
              width: MediaQuery.of(context).size.width * .25,
              controller: widget.totalsControllers['totalBulk']!,
              labelText: 'Total Bulk',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  void calculateTotalQuota() {
    if (widget.totalsControllers['totalBags']!.text != "" &&
        widget.totalsControllers['totalBulk']!.text != "") {
      widget.totalsControllers['totalQuota']!.text =
          (num.parse(widget.totalsControllers['totalBags']!.text) +
                  num.parse(widget.totalsControllers['totalBulk']!.text))
              .toString();
    } else if (widget.totalsControllers['totalBags']!.text == "" &&
        widget.totalsControllers['totalBulk']!.text != "") {
      widget.totalsControllers['totalQuota']!.text =
          (num.parse(widget.totalsControllers['totalBulk']!.text)).toString();
    } else if (widget.totalsControllers['totalBags']!.text != "" &&
        widget.totalsControllers['totalBulk']!.text == "") {
      widget.totalsControllers['totalQuota']!.text =
          (num.parse(widget.totalsControllers['totalBags']!.text)).toString();
    } else {
      widget.totalsControllers['totalQuota']!.text = '0';
    }
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/payment.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_box_item.dart';

class BoxPaymentSummarySection extends StatefulWidget {
  const BoxPaymentSummarySection({
    super.key,
    required this.title,
    required this.subTitle, required this.payments,
   
  });
  final String title;
  final String subTitle;
  final List<Payment>? payments;

  @override
  State<BoxPaymentSummarySection> createState() => _BoxPaymentSummarySectionState();
}

class _BoxPaymentSummarySectionState extends State<BoxPaymentSummarySection> {
  String activeCurrancy = "EGP";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Opacity(
                  opacity: .5,
                  child: Text(
                    widget.subTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
         CustomChckButtons(
          containerColor: kBtnColor,
                buttons: const ["EGP", "USD"],
                activeTab: activeCurrancy == "EGP"?0:1,
                onTap: (value) {
                  activeCurrancy = value;
                  setState(() {});
                }),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBoxItem(
              value: widget.payments!.isNotEmpty? formatNum(widget.payments!.firstWhere((p)=>p.currency == activeCurrancy).amount??0):'0',
              title: 'Daily Amount',
            ),
            const CustomVerticalDivider(
              color: Colors.grey,
              height: 50,
              margin: 0,
            ),
            CustomBoxItem(
              title:'Daily Payment Count',
              value: widget.payments!.isNotEmpty? formatNum(widget.payments!.firstWhere((p)=>p.currency == activeCurrancy).count??0):'0',
            ),
          ],
        )
      ],
    );
  }
}

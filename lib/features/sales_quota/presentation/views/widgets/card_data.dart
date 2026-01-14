import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/daily_quota_section.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/distribute_bloc_consumer.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sales_quota_section.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class CardData extends StatefulWidget {
  const CardData({
    super.key,
    required this.controllers,
    required this.tryToDistribute,
    required this.salesQuotaList,
    required this.totalsControllers,
    required this.onSelectedItem,
  });
  final List<Map<String, TextEditingController>> controllers;
  final Map<String, TextEditingController> totalsControllers;
  final void Function(BuildContext) tryToDistribute;
  final List<SalesQuota> salesQuotaList;
  final void Function(String) onSelectedItem;
  @override
  State<CardData> createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              DailyQuotaSection(
                totalsControllers: widget.totalsControllers,
              ),
              const SizedBox(height: 25),
              SalesQuotaSection(
                onSelectedItem: widget.onSelectedItem,
                salesQuotaList: widget.salesQuotaList,
                controllers: widget.controllers,
                getTotalBagsPickuAndDelivery: (pickupBags, deliveryBags) {},
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const CustomButtonWithIcon(
                  //   child: 'Reset',
                  //   textColor: Colors.black,
                  //   bgColor: Color.fromARGB(255, 234, 234, 235),
                  //   icon: Symbols.restart_alt,
                  //   onHoverColor: Color.fromARGB(255, 170, 170, 172),
                  // ),
                  // const SizedBox(width: 10),
                  DistributeBlocConsumer(
                    tryToDistribute: widget.tryToDistribute,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

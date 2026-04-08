import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_customer_model/dispatch_per_customer_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_grouped_by_sales.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_per_header.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';

class DispatchPerCustomerTableBody extends StatefulWidget {
  const DispatchPerCustomerTableBody({super.key, required this.data});
  final List<DispatchPerCustomerModel> data;
  @override
  State<DispatchPerCustomerTableBody> createState() =>
      _DispatchPerCustomerTableBodyState();
}

class _DispatchPerCustomerTableBodyState
    extends State<DispatchPerCustomerTableBody> {
  QuantityType quantityType = QuantityType.total;
  int activeTab = 2;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const DispatchPerHeader(
            per: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomChckButtons(
                buttons: const ["Delivery", "Pickup", "Both"],
                activeTab: activeTab,
                onTap: (value) {
                  if (value == "Delivery") {
                    activeTab = 0;
                    quantityType = QuantityType.delivery;
                  } else if (value == "Pickup") {
                    activeTab = 1;
                    quantityType = QuantityType.pickup;
                  } else {
                    activeTab = 2;
                    quantityType = QuantityType.total;
                  }
                  setState(() {});
                },
              ),
              CustomToggleButton(onToggle: (value) {}),
            ],
          ),
          const SizedBox(height: 8),
          sectionTitle('Dispatch Details (Per Customer)'),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 900,
                child: Column(
                  children: [
                    buildDispatchPerCustomerHeader(),
                    Expanded(
                      child: ListView(
                        children: buildDispatchPerCustomerGroups(
                            widget.data, quantityType),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

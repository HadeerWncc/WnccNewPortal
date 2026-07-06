import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_details_v2_per_sales_cubit/dispatch_details_v2_per_sales_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class DispatchDetailsPerSalesHeader extends StatefulWidget {
  const DispatchDetailsPerSalesHeader({
    super.key,
    required this.date,
    this.onViewChange,
    required this.viewActiveTab,
    required this.user,
  });
  final UserModel user;
  final DateTime date;
  final String viewActiveTab;
  final dynamic Function(String)? onViewChange;

  @override
  State<DispatchDetailsPerSalesHeader> createState() =>
      _DispatchDetailsPerSalesHeaderState();
}

class _DispatchDetailsPerSalesHeaderState
    extends State<DispatchDetailsPerSalesHeader> {
  int activeTab = 0;
  List<String> incotermList = [];
  List<String> typeList = [];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DispatchDetailsV2PerSalesCubit>();

    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(spacing: 8, runSpacing: 8, children: [
        SizedBox(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.width * .2
              : MediaQuery.of(context).size.width * .35,
          child: CustomDropDownInput(
            title: 'Select',
            items: const ["Per Region", "Per Sales", "Per Customer"],
            selectedValue: "Per Sales",
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Per Region') {
                GoRouter.of(context).push(AppRouter.dispatchDetailsPath);
              } else if (value == "Per Customer") {
                GoRouter.of(context)
                    .push(AppRouter.dispatchDetailsPerCustomerPath);
              }
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.width * .25
              : MediaQuery.of(context).size.width * .5,
          child: CustomYearPicker(
            title: 'Select Year',
            initialDate: widget.date,
            onChange: (value) {
              cubit.getDispatchDetailsV2PerSales(value, activeTab, widget.user);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomChckButtons(
          activeTab: widget.viewActiveTab == "Dates" ? 0 : 1,
          buttons: const ["Dates", "States"],
          onTap: widget.onViewChange,
        ),
        // const SizedBox(
        //   width: 10,
        // ),
        SizedBox(
          // width: 100,
          child: CustomChckButtons(
            activeTab: activeTab,
            buttons: const ["Cust_State", "Disp_State"],
            onTap: (value) {
              if (value == "Cust_State") {
                activeTab = 0;
              } else {
                activeTab = 1;
              }
              setState(() {});
              cubit.getDispatchDetailsV2PerSales(
                widget.date,
                activeTab,
                widget.user,
              );
            },
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: CustomMultiSelectDropDown2(
              products: const ["Delivery", "Pickup"],
              selectedProducts: incotermList,
              onChanged: (value) {
                setState(() {
                  incotermList = value;
                });
                cubit.changeincoterm(value);
              },
              title: "Incoterm",
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: CustomMultiSelectDropDown2(
              products: const ["Bags", "Bulk"],
              selectedProducts: typeList,
              onChanged: (value) {
                setState(() {
                  typeList = value;
                });
                cubit.changeType(value);
              },
              title: "Type",
            ))
      ]),
    );
  }
}

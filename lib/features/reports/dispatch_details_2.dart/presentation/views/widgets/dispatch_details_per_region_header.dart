import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';
import 'package:wncc_portal/core/widgets/multi_select_drop_down.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/helper/get_areas_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_detasils_v2_per_region_cubit/dispatch_detasils_v2_per_region_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class DispatchDetailsPerRegionHeader extends StatefulWidget {
  const DispatchDetailsPerRegionHeader(
      {super.key,
      required this.date,
      required this.onChangeincoterm,
      required this.onChangeType,
      required this.onSelectRegions});
  final DateTime date;
  final Function(List<String> incotermValues) onChangeincoterm;
  final Function(List<String> incotermValues) onChangeType;
  final Function(List<String> regions) onSelectRegions;
  @override
  State<DispatchDetailsPerRegionHeader> createState() =>
      _DispatchDetailsPerRegionHeaderState();
}

class _DispatchDetailsPerRegionHeaderState
    extends State<DispatchDetailsPerRegionHeader> {
  int activeTab = 0;
  List<String> incotermList = [];
  List<String> typeList = [];
  List<String> regionsList = [];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DispatchDetasilsV2PerRegionCubit>();

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
            selectedValue: "Per Region",
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Per Sales') {
                GoRouter.of(context)
                    .push(AppRouter.dispatchDetailsPerSalesPath);
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
              cubit.getDispatchDetailsV2PerRegion(value, activeTab);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
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
              cubit.getDispatchDetailsV2PerRegion(
                widget.date,
                activeTab,
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
                widget.onChangeincoterm(incotermList);
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
              widget.onChangeType(typeList);
            },
            title: "Type",
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: BlocBuilder<DispatchDetasilsV2PerRegionCubit,
              DispatchDetasilsV2PerRegionState>(builder: (context, state) {
            if (state is DispatchDetasilsV2PerRegionSuccess) {
              return MultiSelectDropDown(
                items: getAllRegions(state.dispatchDetails),
                selectedItems: regionsList,
                onChanged: (value) {
                  setState(() {
                    regionsList = value;
                  });
                  widget.onSelectRegions(regionsList);
                },
              );
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: const LoadingBtn(title: 'SelectItems'),
            );
          }),
        ),
      ]),
    );
  }
}

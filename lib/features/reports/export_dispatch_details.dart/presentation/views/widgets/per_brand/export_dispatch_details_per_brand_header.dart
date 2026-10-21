import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/core/widgets/month_year_picker.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/manager/cubits/export_dispatch_per_brand_cubit/export_dispatch_per_brand_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class ExportDispatchDetailsPerBrandHeader extends StatefulWidget {
  const ExportDispatchDetailsPerBrandHeader({
    super.key,
    required this.date,
    required this.onChangeincoterm,
    required this.onChangeType,
    // required this.onChangeBrands,
  });
  final DateTime date;
  final Function(List<String> incotermValues) onChangeincoterm;
  final Function(List<String> typeValues) onChangeType;
  // final Function(List<String> brands) onChangeBrands;
  @override
  State<ExportDispatchDetailsPerBrandHeader> createState() =>
      _ExportDispatchDetailsPerBrandHeaderState();
}

class _ExportDispatchDetailsPerBrandHeaderState
    extends State<ExportDispatchDetailsPerBrandHeader> {
  int activeTab = 0;
  List<String> incotermList = [];
  List<String> typeList = [];
  // List<String> brandsList = [];
  int mode = 2;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExportDispatchPerBrandCubit>();
    bool isLandScape = (MediaQuery.of(context).orientation == Orientation.landscape);
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
          spacing: 8,
          runSpacing: 8,
          runAlignment: WrapAlignment.center,
          children: [
            SizedBox(
              width:
                  isLandScape
                      ? MediaQuery.of(context).size.width * .2
                      : MediaQuery.of(context).size.width * .35,
              child: CustomDropDownInput(
                title: 'Select',
                items: const ["Per Customer", "Per Region", "Per Brand"],
                fontSize: 14,
                selectedValue: "Per Brand",
                onChanged: (value) {
                  // Handle dropdown change
                  if (value == 'Per Region') {
                    GoRouter.of(context)
                        .push(AppRouter.exportDispatchPerRegionPath);
                  } else if (value == "Per Customer") {
                    GoRouter.of(context)
                        .push(AppRouter.dispatchDetailsPerCustomerPath);
                  }
                },
              ),
            ),
            SizedBox(
              width:
                  isLandScape
                      ? MediaQuery.of(context).size.width * .2
                      : MediaQuery.of(context).size.width * .35,
              child: CustomDropDownInput(
                title: 'Select',
                items: const ["Daily", "Monthly"],
                fontSize: 14,
                selectedValue: "Daily",
                onChanged: (value) {
                  // Handle dropdown change
                  setState(() {
                    (value == 'Monthly') ? mode = 1 : mode = 2;
                  });
                  cubit.getExportDispatchPerBrand(date, mode);
                },
              ),
            ),
            mode == 2
                ? CustomMonthYearPicker(
                    title: 'Select Month',
                    // initialDate: widget.date,
                    onChange: (value) {
                      setState(() {
                        date = value;
                      });
                      cubit.getExportDispatchPerBrand(value, 2);
                    },
                  )
                : mode == 1
                    ? CustomYearPicker(
                        title: 'Select Year',
                        initialDate: date,
                        onChange: (currentDate) {
                          setState(() {
                            date = currentDate;
                          });
                          cubit.getExportDispatchPerBrand(currentDate, 1);
                        },
                      )
                    : const SizedBox(),
            SizedBox(
                width: isLandScape
                      ? MediaQuery.of(context).size.width * .2
                      : MediaQuery.of(context).size.width * .4,
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
              width: isLandScape
                      ? MediaQuery.of(context).size.width * .17
                      : MediaQuery.of(context).size.width * .3,
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
          ]),
    );
  }
}

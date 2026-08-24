import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/features/home/presentation/manager/cubites/home_cubit/home_cubit.dart';

class QuotaFilter extends StatefulWidget {
  const QuotaFilter({super.key, this.onChangedIncoterm});
  final Function(List<String>)? onChangedIncoterm;
  @override
  State<QuotaFilter> createState() => _QuotaFilterState();
}

class _QuotaFilterState extends State<QuotaFilter> {
  List<String> selectedSales = [];
  DateTimeRange<DateTime> rangeTime =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TextEditingController codeController = TextEditingController(text: null);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .49,
              child: CustomRangeDatePicker(
                title: 'Select Date',
                onChange: (value) {
                  rangeTime = value;
                },
              ),
            ),
            // const SizedBox(width: 10),
            CustomPlaceholderInput(
              width: MediaQuery.of(context).size.width * .23,
              labelText: 'Code',
              controller: codeController,
            ),
            // const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * .15,
              child: CustomButtonWithIcon(
                onTap: () {
                  String code = codeController.text;
                  if (codeController.text.length < 7) {
                    code = "000${int.parse(code) + 1000000}";
                  }
                  if (codeController.text.length == 7) {
                    code = "000${int.parse(code)}";
                  }
                  BlocProvider.of<HomeCubit>(context)
                      .getHomeSummary(rangeTime.start, rangeTime.end, code);
                },
                child: '',
                textColor: Colors.white,
                bgColor: const Color(0xff029ff8),
                onHoverColor: const Color.fromARGB(255, 2, 125, 197),
                icon: Symbols.search,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccess) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .47,
                      child: CustomMultiSelectDropDown2(
                        products: state.sales,
                        selectedProducts: selectedSales,
                        bgColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            selectedSales = value;
                          });
                          BlocProvider.of<HomeCubit>(context)
                              .selectSales(selectedSales);
                        },
                        title: "Sales",
                      ));
                }
                return SizedBox(
                    width: MediaQuery.of(context).size.width * .32,
                    child: const CustomMultiSelectDropDown2(
                      products: [],
                      selectedProducts: [],
                      bgColor: Colors.white,
                      onChanged: null,
                      title: "Sales",
                    ));
              },
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: CustomMultiSelectDropDown2(
                products: const ["Delivery", "Pickup"],
                selectedProducts: [],
                bgColor: Colors.white,
                onChanged: widget.onChangedIncoterm,
                title: "Incoterm",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

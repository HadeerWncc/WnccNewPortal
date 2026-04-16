import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class FilterPickupDataInputs extends StatelessWidget {
  const FilterPickupDataInputs({
    super.key,
    required this.payerController,
    required this.selectedSales,
    required this.onFilter,
    required this.salesNames,
  });
  final TextEditingController payerController;
  final String selectedSales;
  final List<String> salesNames;
  final Function(String payer, String sales) onFilter;
  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment: WrapAlignment.spaceBetween,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPlaceholderInput(
          controller: payerController,
          labelText: "Payer",
          width: MediaQuery.of(context).size.width * .23,
          onChanged: (value) {
            onFilter(
              value,
              selectedSales,
            );
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .4,
          child: CustomDropDownInput(
            selectedValue: selectedSales,
            items: salesNames,
            title: "Sales",
            onChanged: (value) {
              onFilter(
                payerController.text,
                value!,
              );
            },
          ),
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * .24,
        //   child: CustomDropDownInput(
        //     selectedValue: selectedRegion,
        //     items: regions,
        //     title: "Region",
        //     onChanged: (value) {
        //       onFilter(
        //         payerController.text,
        //         selectedSales,
        //         value!,
        //         selectedProduct,
        //       );
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * .24,
        //   child: CustomDropDownInput(
        //     selectedValue: selectedProduct,
        //     items: const [
        //       "All",
        //       "مصري",
        //       "وادي النيل",
        //       "سائب",
        //     ],
        //     title: "Product",
        //     onChanged: (value) {
        //       onFilter(
        //         payerController.text,
        //         selectedSales,
        //         selectedRegion,
        //         value!,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

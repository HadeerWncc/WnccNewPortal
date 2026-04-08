import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class FilterDataInputs extends StatelessWidget {
  const FilterDataInputs(
      {super.key,
      required this.payerController,
      required this.selectedSales,
      required this.selectedRegion,
      required this.selectedProduct,
      required this.onFilter,
      required this.salesNames,
      required this.regions});
  final TextEditingController payerController;
  final String selectedSales;
  final String selectedRegion;
  final String selectedProduct;
  final List<String> salesNames;
  final List<String> regions;
  final Function(String payer, String sales, String region, String product)
      onFilter;
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
              selectedRegion,
              selectedProduct,
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
                selectedRegion,
                selectedProduct,
              );
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .24,
          child: CustomDropDownInput(
            selectedValue: selectedRegion,
            items: regions,
            title: "Region",
            onChanged: (value) {
              onFilter(
                payerController.text,
                selectedSales,
                value!,
                selectedProduct,
              );
            },
          ),
        ),
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

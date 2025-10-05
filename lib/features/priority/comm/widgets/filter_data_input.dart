import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class FilterDataInputs extends StatelessWidget {
  const FilterDataInputs({
    super.key,
    required this.payerController,
    required this.selectedSales,
    required this.selectedRegion,
    required this.selectedProduct,
    required this.onFilter,
  });
  final TextEditingController payerController;
  final String selectedSales;
  final String selectedRegion;
  final String selectedProduct;
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
          width: MediaQuery.of(context).size.width * .24,
          child: CustomDropDownInput(
            selectedValue: selectedSales,
            items: const [
              "All",
              "Sales 1",
              "Sales 2",
              "Sales 3",
            ],
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
            items: const [
              "All",
              "Region 1",
              "Region 2",
              "Region 3",
            ],
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
        SizedBox(
          width: MediaQuery.of(context).size.width * .24,
          child: CustomDropDownInput(
            selectedValue: selectedProduct,
            items: const [
              "All",
              "مصرى",
              "وادى النيل",
              "سائب",
            ],
            title: "Product",
            onChanged: (value) {
              onFilter(
                payerController.text,
                selectedSales,
                selectedRegion,
                value!,
              );
            },
          ),
        ),
      ],
    );
  }
}

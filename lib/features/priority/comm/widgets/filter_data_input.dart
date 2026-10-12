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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape =
            MediaQuery.orientationOf(context) == Orientation.landscape;

        return Row(
          mainAxisAlignment: isLandscape
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
              spacing: 5,
          children: [
            CustomPlaceholderInput(
              controller: payerController,
              labelText: "Payer",
              width: isLandscape
                  ? constraints.maxWidth * 0.2
                  : constraints.maxWidth * 0.30,
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
              width: isLandscape
                  ? constraints.maxWidth * 0.3
                  : constraints.maxWidth * 0.4,
              child: CustomDropDownInput(
                fontSize: 14,
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
              width: isLandscape
                  ? constraints.maxWidth * 0.14
                  : constraints.maxWidth * 0.24,
              child: CustomDropDownInput(
                fontSize: 13,
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
          ],
        );
      },
    );
  }
}

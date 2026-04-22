import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multi_select_drop_down2.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class FilterPickupDataInputs extends StatelessWidget {
  const FilterPickupDataInputs({
    super.key,
    required this.payerController,
    required this.selectedSales,
    required this.onFilter,
    required this.salesNames,
    required this.selectedProduct,
    required this.products,
    required this.selectedStatus,
    required this.status,
  });
  final TextEditingController payerController;
  final String selectedSales;
  final List<String> salesNames;
  final List<String> selectedProduct;
  final List<String> products;
  final String selectedStatus;
  final List<String> status;
  final Function(
      String payer, String sales, List<String> product, String status) onFilter;
  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: WrapAlignment.spaceBetween,
      // spacing: 5,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // runSpacing: 5,
      children: [
        Row(
          children: [
            CustomPlaceholderInput(
              controller: payerController,
              labelText: "Payer",
              width: MediaQuery.of(context).size.width * .23,
              onChanged: (value) {
                onFilter(value, selectedSales, selectedProduct, selectedStatus);
              },
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width * .27,
              child: CustomDropDownInput(
                selectedValue: selectedSales,
                items: salesNames,
                title: "Sales",
                onChanged: (value) {
                  onFilter(payerController.text, value!, selectedProduct,
                      selectedStatus);
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: CustomMultiSelectDropDown2(
                  products: products,
                  selectedProducts: selectedProduct,
                  onChanged: (value) {
                    onFilter(payerController.text, selectedSales, value,
                        selectedStatus);
                  },
                )),
            const SizedBox(width: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: CustomDropDownInput(
                selectedValue: selectedStatus,
                items: status,
                title: "Status",
                onChanged: (value) {
                  onFilter(
                    payerController.text,
                    selectedSales,
                    selectedProduct,
                    value!,
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

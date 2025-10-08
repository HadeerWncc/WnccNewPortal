import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/rows_price.dart';

class ProductPriceContent extends StatelessWidget {
  const ProductPriceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const RowsPrice(),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 10),
              CustomMultiSelectDropDown(
                selectedValue: null,
                hintText: 'Select Regions',
                items: const ["Alex", "Cairo", "Fayoum", "Giza"],
                onChanged: (values) {},
                title: "Specify Regions",
              ),
              const SizedBox(width: 7),
              CustomMultiSelectDropDown(
                selectedValue: null,
                hintText: 'Select Payers',
                items: const ["Mohammed", "Ahmed", "Ali", "Mahmoud"],
                onChanged: (values) {},
                title: "Specify Payers",
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

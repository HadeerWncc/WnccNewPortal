import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
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
          SizedBox(
            height: 10,
          ),
          RowsPrice(),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              CustomMultiSelectDropDown(
                selectedValue: "Alex",
                items: ["Alex", "Cairo", "Fayoum", "Giza"],
                onChanged: (values) {},
                title: "Specify Regions",
              ),
              SizedBox(width: 7),
              CustomMultiSelectDropDown(
                selectedValue: "Mohammed",
                items: ["Mohammed", "Ahmed", "Ali", "Mahmoud"],
                onChanged: (values) {},
                title: "Specify Payers",
              ),
              SizedBox(width: 10),

            ],
          ),
        ],
      ),
    );
  }
}

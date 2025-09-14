import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/date_picker.dart';

class FilterPartBody extends StatelessWidget {
  const FilterPartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 30,
        runSpacing: 15,
        children: [
          DatePicker(
            title: 'Selected Pricing Date',
            onChange: (value) {},
          ),
          CustomDropDownInput(
            width: MediaQuery.of(context).size.width * .35,
            selectedValue: "Bags",
            items: const ["Bags", "Bulk", "Clincker"],
            title: "Select Product Type",
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

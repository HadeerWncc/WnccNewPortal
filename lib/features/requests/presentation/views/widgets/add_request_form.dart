import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class AddRequestForm extends StatelessWidget {
  const AddRequestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Select Payer',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Contact Person',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Contact Phone',
          ),
          const SizedBox(height: 15),
          CustomMultiSelectDropDown(
            selectedValue: 'Invoice',
            items: const [
              'Invoice',
              'Account_Statement',
              'Dispatch_Report',
              'Annual_Sales_Statement',
              'IRS'
            ],
            title: 'Request types',
            onChanged: (value) {
              print(value);
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: 'Email',
            items: ['Email', 'Fax', 'Post', 'Office'],
            title: 'Delivery',
            onChanged: (value){},
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: 'High',
            items: ['High', 'Fax', 'Post', 'Office'],
            title: 'Request Level',
            onChanged: (value){},
          ),
          const SizedBox(height: 15),
    
           CustomPlaceholderInput(
            controller: TextEditingController(),
            labelText: 'Comment',
            linesNum: 5,
          ),
        ],
      ),
    );
  }
}
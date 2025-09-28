import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_delivery_enum.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_level_enum.dart';

class AddRequestForm extends StatelessWidget {
  const AddRequestForm({
    super.key,
    required this.onRequestTypesChange,
    required this.payerId,
    required this.contactPerson,
    required this.contactPhone,
    required this.comment,
    required this.onRequestDeliveryChange,
    required this.onRequestLevelChange,
  });
  final Function(List<String>) onRequestTypesChange;
  final Function(int) onRequestDeliveryChange;
  final Function(int) onRequestLevelChange;
  final TextEditingController payerId;
  final TextEditingController contactPerson;
  final TextEditingController contactPhone;
  final TextEditingController comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: payerId,
            labelText: 'Payer Id',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: contactPerson,
            labelText: 'Contact Person',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: contactPhone,
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
              onRequestTypesChange(value);
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: null,
            items: getRequestDeliveryListOfString(),
            hintText: 'Select Type',
            title: 'Delivery',
            onChanged: (value) {
              RequestDelivery delivery =
                  RequestDelivery.values.firstWhere((d) => d.name == value);
              int requestDelivery = delivery.index;
              onRequestDeliveryChange(requestDelivery);
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: null,
            hintText: 'Select Level',
            items: getRequestLevelListOfString(),
            title: 'Request Level',
            onChanged: (value) {
              SupportLevel level =
                  SupportLevel.values.firstWhere((d) => d.name == value);
              int requestLevel = level.index;
              onRequestLevelChange(requestLevel);
            },
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: comment,
            labelText: 'Comment',
            linesNum: 5,
          ),
        ],
      ),
    );
  }
}

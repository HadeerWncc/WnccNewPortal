import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_delivery_enum.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_level_enum.dart';

class EditRequestForm extends StatelessWidget {
  const EditRequestForm({
    super.key,
    required this.onRequestTypesChange,
    required this.onRequestDeliveryChange,
    required this.onRequestLevelChange,
    required this.payerId,
    required this.contactPerson,
    required this.contactPhone,
    required this.comment,
  });
  final Function(List<String>) onRequestTypesChange;
  final Function(int) onRequestDeliveryChange;
  final Function(int) onRequestLevelChange;
  final String payerId;
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
            controller: TextEditingController(text: payerId),
            labelText: 'Select Payer',
            enable: false,
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
            selectedValue: null,
            hintText: 'Select types',
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
            hintText: 'Select Type',
            items: getRequestDeliveryListOfString(),
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

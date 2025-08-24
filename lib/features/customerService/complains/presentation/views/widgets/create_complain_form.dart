import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_level_enum.dart';

class CreateComplainForm extends StatelessWidget {
  const CreateComplainForm({
    super.key,
    required this.onRequestTypeChange,
    required this.payerId,
    required this.contactPerson,
    required this.contactPhone,
    required this.comment,
    required this.onRequestLevelChange,
    required this.complainSubject,
  });
  final Function(String) onRequestTypeChange;
  final Function(int) onRequestLevelChange;
  final TextEditingController payerId;
  final TextEditingController complainSubject;
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
          CustomPlaceholderInput(
            controller: complainSubject,
            labelText: 'Complain Subject',
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: 'Accounting/Fax',
            items: const [
              'Accounting/Fax',
              'Call Center',
              'Cement/Bags Quality',
              'SMS',
              'Customer Service Agent',
              'Website',
              'Sales Rep',
              'Other',
            ],
            title: 'Complain type',
            onChanged: (value) {
              onRequestTypeChange(value ?? "");
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: 'Call Center',
            items: const ['Call Center', 'Mobile App'],
            title: 'C_Source',
            onChanged: (value) {
              // RequestDelivery delivery =
              //     RequestDelivery.values.firstWhere((d) => d.name == value);
              // int requestDelivery = delivery.index;
              // onRequestDeliveryChange(requestDelivery);
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: getRequestLevelListOfString()[0],
            items: getRequestLevelListOfString(),
            title: 'Complain Priority',
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
            labelText: 'Complain',
            linesNum: 5,
          ),
        ],
      ),
    );
  }
}

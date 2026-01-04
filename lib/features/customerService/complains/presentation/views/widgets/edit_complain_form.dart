import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_level_enum.dart';

class EditComplainForm extends StatefulWidget {
  const EditComplainForm({
    super.key,
    required this.payerId,
    required this.onRequestTypeChange,
    required this.onRequestLevelChange,
    required this.complainSubject,
    required this.contactPerson,
    required this.contactPhone,
    required this.comment, required this.complainEntity,
  });
 
  final Function(String) onRequestTypeChange;
  final Function(int) onRequestLevelChange;
  final TextEditingController payerId;
  final TextEditingController complainSubject;
  final TextEditingController contactPerson;
  final TextEditingController contactPhone;
  final TextEditingController comment;
  final ComplainEntity complainEntity;  

  @override
  State<EditComplainForm> createState() => _EditComplainFormState();
}

class _EditComplainFormState extends State<EditComplainForm> {
  @override
  Widget build(BuildContext context) {
    // widget.payerId.text = widget.complainEntity.payerId!;
    // widget.contactPerson.text = widget.complainEntity.contactPerson!;
    // widget.contactPhone.text = widget.complainEntity.contactPhone!;
    // widget.complainSubject.text = widget.complainEntity.subject!;
    // widget.comment.text = widget.complainEntity.description!;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: widget.payerId,
            labelText: 'Payer',
            enable: false,
            
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: widget.contactPerson,
            labelText: 'Contact Person',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: widget.contactPhone,
            labelText: 'Contact Phone',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: widget.complainSubject,
            labelText: 'Complain Subject',
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: widget.complainEntity.type,
            hintText: 'Select Type',
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
              widget.onRequestTypeChange(value ?? "");
            },
          ),
          const SizedBox(height: 15),
          CustomDropDownInput(
            selectedValue: null,
            hintText: 'Select C_Source',
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
            selectedValue: SupportLevel.values[widget.complainEntity.level!.index].name,
            hintText: 'Select Level',
            items: getRequestLevelListOfString(),
            title: 'Complain Priority',
            onChanged: (value) {
              SupportLevel level =
                  SupportLevel.values.firstWhere((d) => d.name == value);
              int requestLevel = level.index;
              widget.onRequestLevelChange(requestLevel);
            },
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            controller: widget.comment,
            labelText: 'Complain',
            linesNum: 5,
          ),
        ],
      ),
    );
  }
}

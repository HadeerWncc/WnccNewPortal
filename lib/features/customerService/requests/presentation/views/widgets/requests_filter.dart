import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class RequestsFilter extends StatelessWidget {
  const RequestsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPlaceholderInput(
            width: MediaQuery.of(context).size.width * .4,
            controller: TextEditingController(),
            labelText: 'Select Payer',
          ),
          CustomDropDownInput(
            width: MediaQuery.of(context).size.width * .3,
            selectedValue: null,
            hintText: 'Select Status',
            items: const ['AllPending', 'Pending', 'Delivered', 'Finished'],
            title: 'Status',
            onChanged: (value) {
              if (value == 'AllPending') {
                //GetAllData
              } else {
                //Get Data With Status filtration
                //Most get payer Id

                ShowSnackbar.showSnackBar(
                    context, 'Please Enter Payer Code', 'W');
              }
            },
          ),
        ],
      ),
    );
  }
}

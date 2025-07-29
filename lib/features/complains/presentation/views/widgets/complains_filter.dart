import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class ComplainsFilter extends StatelessWidget {
  const ComplainsFilter({super.key});

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
            selectedValue: 'Created',
            items: const ['Created', 'Pending', 'Closed'],
            title: 'Status',
            onChanged: (value) {
              if (value == 'Created') {
                //GetAllData
                //if payer => get Created for that payer
                //else => get All Created
              } else {
                //Get Data With Status filtration
                //Most get payer Id

                ShowSnackbar.showSnackBar(context, 'Please Enter Payer Code');
              }
            },
          ),
        ],
      ),
    );
  }
}

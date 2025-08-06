import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class ForwardedContentBody extends StatelessWidget {
  const ForwardedContentBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Forward the request to concerned users"),
          const SizedBox(height: 20),
          CustomMultiSelectDropDown(
            selectedValue: 'Adminstrator',
            items: const ['Adminstrator', 'Hadeer'],
            onChanged: (value) {},
            title: 'Forward to',
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            linesNum: 3,
            width: MediaQuery.of(context).size.width * .685,
            controller: TextEditingController(),
            labelText: 'Forwarded reason...',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

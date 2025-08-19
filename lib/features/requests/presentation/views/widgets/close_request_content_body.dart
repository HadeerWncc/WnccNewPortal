import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class CloseRequestContentBody extends StatelessWidget {
  const CloseRequestContentBody({
    super.key,
    required this.onType,
  });
  final Function(String) onType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("You cannot modify the request after it has been closed!"),
          const SizedBox(height: 20),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            linesNum: 4,
            width: MediaQuery.of(context).size.width * .685,
            controller: TextEditingController(),
            labelText: 'Final Result...',
            onChanged: onType,
          ),
        ],
      ),
    );
  }
}

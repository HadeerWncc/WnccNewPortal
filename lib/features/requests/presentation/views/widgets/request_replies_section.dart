import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class RequestRepliesSection extends StatelessWidget {
  const RequestRepliesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request Replies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  child: const Text('+0'),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 15),
          const SizedBox(
            height: 150,
            child: Text(''),
          ),
          const Divider(),
          CustomPlaceholderInput(
            xAxis: MainAxisAlignment.center,
            controller: TextEditingController(),
            labelText: "Type your reply...",
            width: MediaQuery.of(context).size.width * .87,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * .87,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWithIcon(
                  child: 'Reply',
                  textColor: Colors.white,
                  bgColor: kBtnColor,
                  icon: Symbols.send,
                  onHoverColor: Color.fromARGB(255, 88, 164, 250),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

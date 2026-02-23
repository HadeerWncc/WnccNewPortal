import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';

class OverAllGrowthItem extends StatelessWidget {
  const OverAllGrowthItem(
      {super.key,
      required this.title,
      required this.quantity,
      required this.presentage,
      required this.compareInfo});
  final String title;
  final String quantity;
  final String presentage;
  final String compareInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 207, 207, 207)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff17c653)),
          ),
          const SizedBox(height: 5),
          MarkedText(
            child: quantity,
            color: const Color(0xff17c653),
            padding: const EdgeInsets.all(5),
            fontSize: 15,
          ),
          const SizedBox(height: 5),
          Text(
            presentage,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            compareInfo,
            style: const TextStyle(
                fontSize: 13, color: Color.fromARGB(255, 115, 115, 115)),
          ),
        ],
      ),
    );
  }
}

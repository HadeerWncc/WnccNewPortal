import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';

class DispatchedTodayCircularChart extends StatelessWidget {
  const DispatchedTodayCircularChart({
    super.key,
    required this.dispatchPricentage,
  });
  final String dispatchPricentage;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 65,
      lineWidth: 7,
      percent: parseToInt(dispatchPricentage) / 100,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${parseToInt(dispatchPricentage)}%",
            style: const TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: homeColor),
          ),
          const Text(
            "Dispatched Today",
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.bold, color: homeColor),
          ),
        ],
      ),
      progressColor: const Color.fromARGB(255, 18, 177, 87),
      backgroundColor: homeColor,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
    );
  }
}

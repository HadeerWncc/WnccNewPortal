import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/home/helper/methods.dart';

class QuotaCardContant extends StatelessWidget {
  const QuotaCardContant({
    super.key,
    required this.user,
    required this.quota,
    required this.priority,
  });

  final UserModel user;
  final num quota;
  final num priority;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${getGreeting().keys.toList()[0]}, ${user.fullName}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: homeColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              getGreeting().values.toList()[0],
              style: const TextStyle(fontSize: 17),
            ),
            // const Icon(Icons.waving_hand, color: Colors.amber,),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Your quota today is ${formatNum(quota)}',
          style: const TextStyle(
            fontSize: 16,
            color: homeColor,
          ),
        ),
        const SizedBox(height: 12),
        LinearPercentIndicator(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          lineHeight: 3,
          percent: priority / quota,
          barRadius: const Radius.circular(20),
          backgroundColor: homeColor,
          progressColor: const Color.fromARGB(255, 18, 177, 87),
          animation: true,
        ),
        const SizedBox(height: 10),
        Text(
          '${formatNum(priority)}/${formatNum(quota)} completed . ${parseToInt(formatNum((priority / quota) * 100))}%',
          style: const TextStyle(
            color: homeColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

class CompForwardBody extends StatelessWidget {
  const CompForwardBody({super.key, required this.forwardedUsers});
  final List<ForwardUser> forwardedUsers;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: forwardedUsers.map((forwardUser) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCircelLetterContainer(
                letter: forwardUser.forwardTo!.toUpperCase().characters.first,
                bgColor: kBtnColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(forwardUser.forwardTo ?? ""),
                  Opacity(
                    opacity: .5,
                    child: Text(DateFormat('d/M/yyyy h:m')
                        .format(forwardUser.forwardedAt!)),
                  ),
                ],
              ),
            ],
          ),
          forwardUser.isViewed!
              ? const Icon(Symbols.check, color: kBtnColor)
              : const Icon(Symbols.check,
                  color: Color.fromARGB(255, 168, 168, 169)),
        ],
      );
    }).toList());
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

class ForwardedSectionBody extends StatelessWidget {
  const ForwardedSectionBody({super.key, required this.forwardedList});
  final List<ForwardUser> forwardedList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: forwardedList.map((forwared) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomCircelLetterContainer(
                  letter: forwared.forwardTo!.toUpperCase().characters.first,
                  bgColor: kBtnColor,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(forwared.forwardTo ?? ""),
                    Opacity(
                      opacity: .5,
                      child: Text(DateFormat('d/M/yyyy h:m')
                          .format(forwared.forwardedAt!)),
                    ),
                  ],
                ),
              ],
            ),
            forwared.isViewed!
                ? const Icon(Symbols.check, color: kBtnColor)
                : const Icon(Symbols.check,
                    color: Color.fromARGB(255, 168, 168, 169)),
          ],
        );
      }).toList(),
    );
  }
}

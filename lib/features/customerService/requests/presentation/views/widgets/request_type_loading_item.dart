import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_type_action_item.dart';

class RequestTypeLoadingItem extends StatelessWidget {
  const RequestTypeLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(7),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: const MarkedText(child: 'typeName'),
            ),
            const SizedBox(width: 3),
            const CustomMarkedColorContainer(
                title: 'status',
                color: Colors.green,
                bgColor: Color(0xffDDFCEC)),
            const Spacer(),
            const RequestTypeActionItem(
              icon: Symbols.cancel,
            ),
            const RequestTypeActionItem(
              icon: Symbols.check_circle,
            ),
          ],
        ),
      ),
    );
  }
}

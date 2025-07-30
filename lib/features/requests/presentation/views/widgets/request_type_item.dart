import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_type_action_item.dart';

class RequestTypeItem extends StatelessWidget {
  const RequestTypeItem({
    super.key,
    required this.typeName,
    required this.status,
    this.onTap,
    required this.active,
  });
  final String typeName;
  final String status;
  final void Function()? onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          color: active ? kBtnColor : Colors.grey,
          borderType: BorderType.RRect,
          radius: const Radius.circular(7),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: MarkedText(child: typeName),
              ),
              CustomMarkedColorContainer(
                  title: status,
                  color: Colors.green,
                  bgColor: const Color(0xffDDFCEC)),
              const Spacer(),
              const RequestTypeActionItem(icon: Symbols.cancel),
              const RequestTypeActionItem(icon: Symbols.check_circle),
            ],
          ),
        ),
      ),
    );
  }
}

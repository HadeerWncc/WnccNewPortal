import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/payer_info_section.dart';

class RequestDetailsInfo extends StatelessWidget {
  const RequestDetailsInfo({
    super.key,
    required this.requestDetailsEntity,
  });
  final RequestDetailsEntity requestDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PayerInfoSection(
          requestDetailsEntity: requestDetailsEntity,
        ),
        Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(10),
          height: 100,
          child: Text(requestDetailsEntity.description ?? ""),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MarkedText(
              child:
                  'Request delivery by ${getRequestDeliveryText(requestDetailsEntity.delivery)}',
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

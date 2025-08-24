import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';

class RequestDetailsHeader extends StatelessWidget {
  const RequestDetailsHeader({
    super.key,
    required this.requestDetailsEntity,
  });
  final RequestDetailsEntity requestDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Payer Request-(${requestDetailsEntity.id})',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              CustomMarkedColorContainer(
                title: getRequestLevelText(requestDetailsEntity.level),
                color: const Color.fromARGB(255, 0, 139, 253),
                bgColor: const Color.fromARGB(255, 223, 236, 248),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const Opacity(
                    opacity: .5,
                    child: Text(
                      'Created by:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    requestDetailsEntity.createdBy ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

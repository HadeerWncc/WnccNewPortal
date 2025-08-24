import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/followup_section.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_type_item_list.dart';

class RequestTypesActions extends StatefulWidget {
  const RequestTypesActions({
    super.key,
    required this.requestDetailsEntity,
  });

  final RequestDetailsEntity requestDetailsEntity;

  @override
  State<RequestTypesActions> createState() => _RequestTypesActionsState();
}

class _RequestTypesActionsState extends State<RequestTypesActions> {
  List<LogEntity> requestLogs = [];
  String requestName = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: RequestTypeItemList(
            requestId: widget.requestDetailsEntity.id!,
            requestTypes: widget.requestDetailsEntity.requestTypes!,
            onSelect: (requestLog, reqName) {
              setState(() {
                requestLogs = requestLog;
                requestName = reqName;
              });
            },
          ),
        ),
        FollowUpSection(
          logs: requestName != ""
              ? requestLogs
              : widget.requestDetailsEntity.requestTypes![0].logs!,
          requestName: requestName != ""
              ? requestName
              : widget.requestDetailsEntity.requestTypes![0].name,
        ),
      ],
    );
  }
}

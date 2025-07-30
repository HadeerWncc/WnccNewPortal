import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_type_entity.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_type_item.dart';

class RequestTypeItemList extends StatefulWidget {
  const RequestTypeItemList({
    super.key,
    required this.requestTypes,
    required this.onSelect,
  });
  final List<RequestTypeEntity> requestTypes;
  final Function(List<LogEntity> requestLog, String requestName) onSelect;
  @override
  State<RequestTypeItemList> createState() => _RequestTypeItemListState();
}

class _RequestTypeItemListState extends State<RequestTypeItemList> {
  String selectedType = "";
  @override
  Widget build(BuildContext context) {
    // widget.onSelect(widget.requestTypes[0].logs!,widget.requestTypes[0].name);
    return Column(
      children: widget.requestTypes.map((type) {
        if (selectedType == "") //first time
        {
          selectedType = type.name;
          // widget.onSelect(type.logs!,type.name);
        }
        return RequestTypeItem(
          typeName: type.name,
          status: getRequestStatusText(type.status),
          onTap: () {
            selectedType = type.name;
            widget.onSelect(type.logs!, type.name);
            setState(() {});
          },
          active: selectedType == type.name,
        );
      }).toList(),
    );
  }
}

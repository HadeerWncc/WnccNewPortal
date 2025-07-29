import 'package:flutter/material.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_type_item.dart';

class RequestTypeItemList extends StatefulWidget {
  const RequestTypeItemList({
    super.key,
    required this.requestTypes,
  });
  final List<String> requestTypes;
  @override
  State<RequestTypeItemList> createState() => _RequestTypeItemListState();
}

class _RequestTypeItemListState extends State<RequestTypeItemList> {
  String selectedType = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.requestTypes.map((type) {
        return RequestTypeItem(
          typeName: type,
          state: 'Approved',
          onTap: () {
            selectedType = type;
            setState(() {});
          },
          active: selectedType == type,
        );
      }).toList(),
    );
  }
}

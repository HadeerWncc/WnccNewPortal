import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_type_loading_item.dart';

class LoadingRequestTypeList extends StatelessWidget {
  const LoadingRequestTypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          RequestTypeLoadingItem(),
          RequestTypeLoadingItem(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/loading_followup_section.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/loading_request_type_list.dart';

class LoadingRequestTypesAction extends StatelessWidget {
  const LoadingRequestTypesAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Column(
        children: [
          LoadingRequestTypeList(),
          LoadingFollowUpsection(),
        ],
      ),
    );
  }
}

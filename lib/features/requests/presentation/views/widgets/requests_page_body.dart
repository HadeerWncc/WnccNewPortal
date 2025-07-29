import 'package:flutter/material.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/add_request_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/get_all_requests_bloc_builder.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/requests_filter.dart';

class RequestsPageBody extends StatelessWidget {
  const RequestsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AddRequestSection(),
          RequestsFilter(),
          GetAllRequestsBlocBuilder(),
        ],
      ),
    );
  }
}

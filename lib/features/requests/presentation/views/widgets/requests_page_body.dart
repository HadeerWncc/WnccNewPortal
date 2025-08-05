import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/add_request_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/get_all_requests_bloc_builder.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/requests_filter.dart';

class RequestsPageBody extends StatelessWidget {
  const RequestsPageBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AddRequestSection(),
          const RequestsFilter(),
          GetAllRequestsBlocBuilder(user: user),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/requests/presentation/managers/close_request_cubit/close_request_cubit.dart';

class ComplainDetailsBody extends StatelessWidget {
  const ComplainDetailsBody({super.key, required this.user, required this.complains});
  final UserModel user;
  final ComplainDetailsEntity complains;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // CustomRequestActionSection(requestId: requestDetailsEntity.id!),
          const Divider(),
          // CloseRequestActionSection(
          //   requestId: requestDetailsEntity.id!,
          // ),
          // RequestDetailsHeader(
          //   requestDetailsEntity: requestDetailsEntity,
          // ),
          // ContactPersonInfoSection(
          //   requestDetailsEntity: requestDetailsEntity,
          // ),
          // RequestDetailsInfo(
          //   requestDetailsEntity: requestDetailsEntity,
          // ),
          const SizedBox(height: 10),
          const DividerLine(),
          const SizedBox(height: 10),
          // RequestTypesActions(requestDetailsEntity: requestDetailsEntity),
          // const RequestForwardedblocBuilder(),
          // RequestRepliesBlocBuilder(
          //     user: user, requestDetailsEntity: requestDetailsEntity),
        ],
      ),
    );
  }
}
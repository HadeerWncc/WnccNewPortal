import 'package:flutter/material.dart';
import 'package:wncc_portal/features/home/updates/data/models/updates_model/updates_model.dart';
import 'package:wncc_portal/features/home/updates/presentation/views/widgets/update_text_tail.dart';
import 'package:wncc_portal/features/home/updates/presentation/views/widgets/updates_text_contant.dart';

class UpdatesBoxContent extends StatelessWidget {
  const UpdatesBoxContent({
    super.key,
    required this.updatesModel,
  });
  final UpdatesModel updatesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpdatesTextContant(
          content: updatesModel.content ?? 'No Content',
        ),
        const SizedBox(height: 10),
        UpdateTextTail(
          date: updatesModel.createdAt ?? DateTime.now(),
          name: updatesModel.createdBy!.fullName ?? 'Unknown',
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

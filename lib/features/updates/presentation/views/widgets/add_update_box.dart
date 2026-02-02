import 'package:flutter/material.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/add_update_action.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/add_updates_inputs.dart';

class AddUpdateBox extends StatelessWidget {
  const AddUpdateBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [AddUpdatesInputs(), SizedBox(height: 10), AddUpdateActions()],
    );
  }
}

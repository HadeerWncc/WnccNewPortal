import 'package:flutter/material.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/created_at_text.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/created_by_text.dart';

class UpdateTextTail extends StatelessWidget {
  const UpdateTextTail({
    super.key,
    required this.date,
    required this.name,
  });
  final DateTime date;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CreatedAtText(
          createdAt: date,
        ),
        CreatedByText(
          createdBy: name,
        ),
      ],
    );
  }
}

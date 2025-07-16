import 'package:flutter/material.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/add_complain_section.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_table.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complains_filter.dart';

class ComplainsPageBody extends StatelessWidget {
  const ComplainsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AddComplainSection(),
          ComplainsFilter(),
          ComplainTable(),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_buttons_list.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_section.dart';

class LoadingDetailsBody extends StatelessWidget {
  const LoadingDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          LoadingDetailsButtonsList(
            activeTab: 0,
          ),
          SizedBox(height: 16),
          Expanded(child: LoadingDetailsSection()),
        ],
      ),
    );
  }
}

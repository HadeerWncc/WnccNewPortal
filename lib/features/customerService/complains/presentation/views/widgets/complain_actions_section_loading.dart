import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';

class ComplainActionsSectionLoading extends StatelessWidget {
  const ComplainActionsSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LoadingBtn(
                title: 'Forward',
              ),
              SizedBox(width: 10),
              LoadingBtn(
                title: 'Follow_up',
              ),
            ],
          ),
          LoadingBtn(
            title: 'Close',
          ),
        ],
      ),
    );
  }
}

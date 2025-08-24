import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';

class CustomRequestActionSectionLoading extends StatelessWidget {
  const CustomRequestActionSectionLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBtn(
            title: 'Forward',
          ),
          SizedBox(width: 10),
          LoadingBtn(
            title: 'Reject All',
          ),
          SizedBox(width: 10),
          LoadingBtn(
            title: 'Approve All',
          ),
        ],
      ),
    );
  }
}

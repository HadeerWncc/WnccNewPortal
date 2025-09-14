import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';

class CustomCloseRequestBtnLoading extends StatelessWidget {
  const CustomCloseRequestBtnLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LoadingBtn(
            title: 'Close',
          )
        ],
      ),
    );
  }
}

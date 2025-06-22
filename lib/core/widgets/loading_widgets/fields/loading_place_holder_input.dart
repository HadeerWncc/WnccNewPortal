import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class LoadingPlaceHolderInput extends StatelessWidget {
  const LoadingPlaceHolderInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .24,
      height: 60,
      decoration: BoxDecoration(
        color: kLoadingColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

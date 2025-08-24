import 'package:flutter/material.dart';

class LoadingInfoItem extends StatelessWidget {
  const LoadingInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
    );
  }
}
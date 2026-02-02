import 'package:flutter/material.dart';

class UpdatesTextContant extends StatelessWidget {
  const UpdatesTextContant({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(
        maxLines: 4,
        textDirection: TextDirection.rtl,
        overflow: TextOverflow.ellipsis,
        content,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

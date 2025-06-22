import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/appbar/loading_action_box.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: const EdgeInsets.all(5),
          title: Text(title),
          actions: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  LoadingActionBox(),
                  SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    ));
  }
}

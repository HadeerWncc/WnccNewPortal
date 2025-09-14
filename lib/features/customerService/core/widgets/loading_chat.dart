import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_chat_bubble_for_current_user.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_chat_bubble_for_another_user.dart';

class LoadingChat extends StatelessWidget {
  const LoadingChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Request Replies',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 241, 241, 241),
                    ),
                    child: const Text('+0'),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  reverse: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                        LoadingChatBubbleForCurrentUser(),
                        LoadingChatBubbleForAnotherUser(),
                      ],
                    );
                  }),
            ),
            const Divider(),
            CustomPlaceholderInput(
              xAxis: MainAxisAlignment.center,
              controller: TextEditingController(),
              labelText: "Type your reply...",
              width: MediaQuery.of(context).size.width * .87,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * .87,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoadingBtn(
                    title: 'Reply',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

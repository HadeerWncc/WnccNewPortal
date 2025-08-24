import 'package:flutter/material.dart';

class LoadingChatBubbleForAnotherUser extends StatelessWidget {
  const LoadingChatBubbleForAnotherUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: NetworkImage(""),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'User',
              )
            ],
          ),
          const SizedBox(height: 1),
          Row(
            children: [
              Flexible(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF27445E),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    softWrap: true,
                    maxLines: 30,
                    overflow: TextOverflow.visible,
                    "                                                              ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(width: 100,height: 15,color: Colors.amber,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
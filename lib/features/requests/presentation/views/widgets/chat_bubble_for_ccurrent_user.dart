import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/message_dto.dart';

class ChatBubbleForCurrentUser extends StatelessWidget {
  const ChatBubbleForCurrentUser({
    super.key,
    required this.message,
  });

  final MessageDto message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "You",
                // style: TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 5),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(message.imageUrl ?? ""),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAF2FF),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    softWrap: true,
                    maxLines: 30,
                    overflow: TextOverflow.visible,
                    message.reply ?? "",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 40, 40, 40),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  DateFormat("d/M/yyyy h:m")
                      .format(message.createdAt ?? DateTime.now()),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

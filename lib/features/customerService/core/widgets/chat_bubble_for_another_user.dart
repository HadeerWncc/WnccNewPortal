import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/message_dto.dart';

class ChatBubbleForAnotherUser extends StatelessWidget {
  const ChatBubbleForAnotherUser({
    super.key,
    required this.message,
  });

  final MessageDto message;

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
                  image: DecorationImage(
                    image: NetworkImage(message.imageUrl ?? ""),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                message.createdBy ?? "",
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
                  child: Text(
                    softWrap: true,
                    maxLines: 30,
                    overflow: TextOverflow.visible,
                    message.reply ?? "",
                    style: const TextStyle(
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

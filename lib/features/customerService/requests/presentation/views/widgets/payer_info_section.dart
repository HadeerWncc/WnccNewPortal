import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';

class PayerInfoSection extends StatelessWidget {
  const PayerInfoSection({
    super.key,
    required this.requestDetailsEntity,
  });
  final RequestDetailsEntity requestDetailsEntity;
  @override
  Widget build(BuildContext context) {
    Duration diff = DateTime.now().difference(requestDetailsEntity.createdAt!);
    int days = diff.inDays;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;
    String createdFrom = "";
    if (days != 0) {
      createdFrom += ' $days days';
    }
    if (hours != 0) {
      createdFrom += ' $hours hours';
    }
    if (minutes != 0) {
      createdFrom += ' $minutes minutes';
    }
    createdFrom += ' ago';
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff1B85FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            requestDetailsEntity.payerName!.characters.first,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  requestDetailsEntity.payerName ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Symbols.schedule,
                  color: Color.fromARGB(255, 83, 134, 223),
                  size: 16,
                  weight: 900,
                ),
                const SizedBox(width: 4),
                Opacity(
                  opacity: .5,
                  child: Text(
                    createdFrom,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: .5,
              child: Text(
                requestDetailsEntity.payerEmail ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_details_entity.dart';

class ComplainPayerInfoSection extends StatelessWidget {
  const ComplainPayerInfoSection({super.key, required this.complain});
  final ComplainDetailsEntity complain;
  @override
  Widget build(BuildContext context) {
    Duration diff = DateTime.now().difference(complain.createdAt!);
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
    if (minutes >= 1) {
      createdFrom += ' $minutes minutes';
    } else {
      createdFrom = 'less than minute';
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
            complain.payerName!.characters.first,
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
                  complain.payerName ?? "",
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
                complain.payerEmail ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

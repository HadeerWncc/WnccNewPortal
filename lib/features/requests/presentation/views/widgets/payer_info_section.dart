import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PayerInfoSection extends StatelessWidget {
  const PayerInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff1B85FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'M',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Mohamed Elkomy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 2),
                Icon(
                  Symbols.schedule,
                  color: Color.fromARGB(255, 83, 134, 223),
                  size: 16,
                  weight: 900,
                ),
                SizedBox(width: 2),
                Opacity(
                  opacity: .5,
                  child: Text(
                    '1 minute ago',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: .5,
              child: Text(
                'Mohamed.Elkomy@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

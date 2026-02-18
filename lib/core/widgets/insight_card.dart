import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/helper/top_two.dart';

class InsightCardsSection extends StatelessWidget {
  const InsightCardsSection(
      {super.key,
      required this.topTwo,
      required this.title1,
      required this.title2,
      this.subtitle = 'Peak deposit period',
      this.label1 = 'Deposits',
      this.label2 = 'Transactions'});
  final TopTwo topTwo;
  final String title1;
  final String title2;
  final String subtitle;
  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InsightCard(
          badgeText: title1,
          title: topTwo.topFirst.name ?? "",
          subtitle: subtitle,
          value1: NumberFormat.decimalPattern()
              .format(topTwo.topFirst.totalAmount ?? 0),
          label1: label1,
          value2: topTwo.topFirst.transactions.toString(),
          label2: label2,
          accentColor: Colors.green,
        ),
        const SizedBox(height: 10),
        InsightCard(
          badgeText: title2,
          title: topTwo.topSecound.name ?? "",
          subtitle: subtitle,
          value1: NumberFormat.decimalPattern()
              .format(topTwo.topSecound.totalAmount ?? 0),
          label1: label1,
          value2: topTwo.topSecound.transactions.toString(),
          label2: label2,
          accentColor: Colors.green,
        ),
      ],
    );
  }
}

class InsightCard extends StatelessWidget {
  final String badgeText;
  final String title;
  final String subtitle;
  final String value1;
  final String label1;
  final String value2;
  final String label2;
  final Color accentColor;

  const InsightCard({
    super.key,
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.value1,
    required this.label1,
    required this.value2,
    required this.label2,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff4caf50)),
      ),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: accentColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                  color: accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // Title & Subtitle
          Center(
            child: Column(
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Values Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(value1, label1),
              Container(
                  height: 40, width: 1, color: Colors.grey[300]), // Divider
              _buildStatItem(value2, label2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
      ],
    );
  }
}

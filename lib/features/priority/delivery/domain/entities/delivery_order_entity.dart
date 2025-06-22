class DeliveryOrderEntity {
  final String product,
      pod,
      address,
      sales,
      quantity,
      date,
      channel,
      payer,
      payerNo;
  DeliveryOrderEntity({
    required this.product,
    required this.pod,
    required this.address,
    required this.sales,
    required this.quantity,
    required this.date,
    required this.channel,
    required this.payer,
    required this.payerNo,
  });
}

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Container(
//     decoration: BoxDecoration(
//       color: const Color(0xffF9FAFC),
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//         color: Colors.grey.shade300,
//         width: 2,
//       ),
//     ),
//     child: const Row(
//       // scrollDirection: Axis.horizontal,
//       children: [
//         TdTable(
//           child: Text(
//             'Select',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         TdTable(
//           child: Text(
//             'Payer',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     ),
//   ),
// )

// class TdTable extends StatelessWidget {
//   const TdTable({
//     super.key,
//     required this.child,
//   });
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: child,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:wncc_portal/core/constants/colors.dart';
// import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
// import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting_priority/morning_meeting_priority.dart';

// class MorningMeetingPickupTable extends StatelessWidget {
//   const MorningMeetingPickupTable({super.key, this.priorityResponse});
//   final List<MorningMeetingPriority>? priorityResponse;
//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           totalColumn(
//             values:
//                 priorityResponse?.map((e) => e.date ?? "").toList() ??
//                     [],
//             lableName: 'Date',
//             cellWidth: 110,
//           ),
//           Flexible(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   DataTable(
//                     headingRowHeight: 45,
//                     dataRowMinHeight: 38,
//                     dataRowMaxHeight: 42,
//                     headingRowColor: WidgetStateProperty.all(tableHeaderColor),
//                     border: TableBorder.all(color: Colors.grey.shade300),
//                     columns: const [
//                       DataColumn(
//                         label: Text(
//                           'Bags',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Bulk',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),

//                     ],
//                     rows: List<DataRow>.generate(
//                       priorityResponse?.length ?? 0,
//                       (index) {
//                         final item = priorityResponse![index];
//                         return DataRow(
//                           color: (index == priorityResponse!.length - 1)
//                               ? WidgetStateProperty.all(tableHeaderColor)
//                               : null,
//                           cells: [
//                             DataCell(
//                               Text(
//                                 NumberFormat.decimalPattern()
//                                     .format(item.pickup?.bags ?? 0),
//                                 style: TextStyle(
//                                     fontWeight: (index ==
//                                             priorityResponse!.length - 1)
//                                         ? FontWeight.bold
//                                         : FontWeight.normal),
//                               ),
//                             ),
//                             DataCell(
//                               Text(
//                                 NumberFormat.decimalPattern()
//                                     .format(item.pickup?.bulk ?? 0),
//                                 style: TextStyle(
//                                     fontWeight: (index ==
//                                             priorityResponse!.length - 1)
//                                         ? FontWeight.bold
//                                         : FontWeight.normal),
//                               ),
//                             ),

//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';

class PrioritySummary extends StatefulWidget {
  const PrioritySummary({
    super.key,
    required this.prioritySummary,
  });

  final PrioritySummaryModel prioritySummary;

  @override
  State<PrioritySummary> createState() => _PrioritySummaryState();
}

class _PrioritySummaryState extends State<PrioritySummary> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 250,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isLandscape =
    // MediaQuery.of(context).orientation == Orientation.landscape;
    // final cardWidthRatio = isLandscape ? 0.30 : 0.45;
    return LayoutBuilder(
    builder: (context, constraints) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final cardWidth = isLandscape
        ? constraints.maxWidth * 0.30
        : constraints.maxWidth * 0.45;
      return Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  CustomDailyQuotaItem(
                      landingtitle: 'Pending',
                      width: cardWidth,
                      icon: Symbols.weight,
                      data: {
                        "Total": parseToInt(
                            (widget.prioritySummary.totalBulkPending! +
                                    widget.prioritySummary.totalBagsPending!)
                                .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsPending!)
                                .toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkPending!)
                                .toString()),
                      }),
                  CustomDailyQuotaItem(
                      landingtitle: 'Quota',
                      width: cardWidth,
                      icon: Symbols.more_up,
                      data: {
                        "Total": parseToInt(
                            (widget.prioritySummary.totalBulkQuota! +
                                    widget.prioritySummary.totalBagsQuota!)
                                .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsQuota!).toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkQuota!).toString()),
                      }),
                  CustomDailyQuotaItem(
                      landingtitle: 'Extra',
                      width: cardWidth,
                      icon: Symbols.priority,
                      data: {
                        "Total": parseToInt(
                            (widget.prioritySummary.totalBulkExtraQuota! +
                                    widget.prioritySummary.totalBagsExtraQuota!)
                                .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsExtraQuota!)
                                .toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkExtraQuota!)
                                .toString()),
                      }),
                  CustomDailyQuotaItem(
                      landingtitle: 'Priority',
                      width: cardWidth,
                      icon: Symbols.hourglass_empty,
                      data: {
                        "Total": parseToInt(
                            (widget.prioritySummary.totalBulkPriority! +
                                    widget.prioritySummary.totalBagsPriority!)
                                .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsPriority!)
                                .toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkPriority!)
                                .toString()),
                      }),
                  CustomDailyQuotaItem(
                      landingtitle: 'Dispatched',
                      width: cardWidth,
                      icon: Symbols.local_shipping,
                      data: {
                        "Total": parseToInt(
                            (widget.prioritySummary.totalBagsDispatch! +
                                    widget.prioritySummary.totalBulkDispatch!)
                                .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsDispatch!)
                                .toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkDispatch!)
                                .toString()),
                      }),
                  CustomDailyQuotaItem(
                      landingtitle: 'Remaining',
                      width: cardWidth,
                      icon: Symbols.local_shipping,
                      data: {
                        "Total": parseToInt(((widget
                                        .prioritySummary.totalBagsPriority! -
                                    widget.prioritySummary.totalBagsDispatch!) +
                                (widget.prioritySummary.totalBulkPriority! -
                                    widget.prioritySummary.totalBulkDispatch!))
                            .toString()),
                        "Bags": parseToInt(
                            (widget.prioritySummary.totalBagsPriority! -
                                    widget.prioritySummary.totalBagsDispatch!)
                                .toString()),
                        "Bulk": parseToInt(
                            (widget.prioritySummary.totalBulkPriority! -
                                    widget.prioritySummary.totalBulkDispatch!)
                                .toString()),
                      }),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: _scrollRight,
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                color: Colors.green,
                width: 1.5,
              ),
            ),
            icon: const Icon(Icons.arrow_forward,color: Colors.green,),
          ),
        ],
      );
   } );
  }
}



// class PrioritySummary extends StatelessWidget {
//   const PrioritySummary({super.key, required this.prioritySummary});
//   final PrioritySummaryModel prioritySummary;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           spacing: 10,
//           // runSpacing: 10,
//           children: [
//             CustomDailyQuotaItem(
//                 landingtitle: 'Pending',
//                 widthRatio: .45,
//                 icon: Symbols.weight,
//                 data: {
//                   "Total": parseToInt((prioritySummary.totalBulkPending! +
//                           prioritySummary.totalBagsPending!)
//                       .toString()),
//                   "Bags": parseToInt(
//                       (prioritySummary.totalBagsPending!).toString()),
//                   "Bulk": parseToInt(
//                       (prioritySummary.totalBulkPending!).toString()),
//                 }),
//             CustomDailyQuotaItem(
//                 landingtitle: 'Quota',
//                 widthRatio: .45,
//                 icon: Symbols.more_up,
//                 data: {
//                   "Total": parseToInt((prioritySummary.totalBulkQuota! +
//                           prioritySummary.totalBagsQuota!)
//                       .toString()),
//                   "Bags":
//                       parseToInt((prioritySummary.totalBagsQuota!).toString()),
//                   "Bulk":
//                       parseToInt((prioritySummary.totalBulkQuota!).toString()),
//                 }),
//             CustomDailyQuotaItem(
//                 landingtitle: 'Extra',
//                 widthRatio: .45,
//                 icon: Symbols.priority,
//                 data: {
//                   "Total": parseToInt((prioritySummary.totalBulkExtraQuota! +
//                           prioritySummary.totalBagsExtraQuota!)
//                       .toString()),
//                   "Bags": parseToInt(
//                       (prioritySummary.totalBagsExtraQuota!).toString()),
//                   "Bulk": parseToInt(
//                       (prioritySummary.totalBulkExtraQuota!).toString()),
//                 }),
//             CustomDailyQuotaItem(
//                 landingtitle: 'Priority',
//                 widthRatio: .45,
//                 icon: Symbols.hourglass_empty,
//                 data: {
//                   "Total": parseToInt((prioritySummary.totalBulkPriority! +
//                           prioritySummary.totalBagsPriority!)
//                       .toString()),
//                   "Bags": parseToInt(
//                       (prioritySummary.totalBagsPriority!).toString()),
//                   "Bulk": parseToInt(
//                       (prioritySummary.totalBulkPriority!).toString()),
//                 }),
//             CustomDailyQuotaItem(
//                 landingtitle: 'Dispatched',
//                 widthRatio: .45,
//                 icon: Symbols.local_shipping,
//                 data: {
//                   "Total": parseToInt((prioritySummary.totalBagsDispatch! +
//                           prioritySummary.totalBulkDispatch!)
//                       .toString()),
//                   "Bags": parseToInt(
//                       (prioritySummary.totalBagsDispatch!).toString()),
//                   "Bulk": parseToInt(
//                       (prioritySummary.totalBulkDispatch!).toString()),
//                 }),
//             CustomDailyQuotaItem(
//                 landingtitle: 'Remaining',
//                 widthRatio: .45,
//                 icon: Symbols.local_shipping,
//                 data: {
//                   "Total": parseToInt(((prioritySummary.totalBagsPriority! -
//                               prioritySummary.totalBagsDispatch!) +
//                           (prioritySummary.totalBulkPriority! -
//                               prioritySummary.totalBulkDispatch!))
//                       .toString()),
//                   "Bags": parseToInt((prioritySummary.totalBagsPriority! -
//                           prioritySummary.totalBagsDispatch!)
//                       .toString()),
//                   "Bulk": parseToInt((prioritySummary.totalBulkPriority! -
//                           prioritySummary.totalBulkDispatch!)
//                       .toString()),
//                 }),
//           ],
//         ),
    
    
//       ),
//     );
//   }
// }

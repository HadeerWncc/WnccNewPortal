import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/entities/loading_details_summary_entity.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/custom_summary.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class LoadingDetailsSummary extends StatefulWidget {
  const LoadingDetailsSummary(
      {super.key, required this.loadingDetailsSummaryEntity});
  final LoadingDetailsSummaryEntity loadingDetailsSummaryEntity;

  @override
  State<LoadingDetailsSummary> createState() => _LoadingDetailsSummaryState();
}

class _LoadingDetailsSummaryState extends State<LoadingDetailsSummary> {
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
    return LayoutBuilder(builder: (context, constraints) {
      final isLandscape =
          MediaQuery.orientationOf(context) == Orientation.landscape;

      final cardWidth =
          isLandscape ? 0.2 : 0.3;
      return Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  CustomSummary(
                    landingtitle: 'Wadie',
                    widthRatio: cardWidth,
                    icon: Symbols.weight,
                    child: CustomQuantityComparing(
                      mainTitle: NumberFormat.decimalPattern()
                          .format(widget.loadingDetailsSummaryEntity.wadie),
                    ),
                  ),
                  CustomSummary(
                    landingtitle: 'Masry',
                    widthRatio: cardWidth,
                    icon: Symbols.weight,
                    child: CustomQuantityComparing(
                      mainTitle: NumberFormat.decimalPattern()
                          .format(widget.loadingDetailsSummaryEntity.masry),
                    ),
                  ),
                  CustomSummary(
                    landingtitle: 'Bulk',
                    widthRatio: cardWidth,
                    icon: Symbols.weight,
                    child: CustomQuantityComparing(
                      mainTitle: NumberFormat.decimalPattern()
                          .format(widget.loadingDetailsSummaryEntity.bulk),
                    ),
                  ),
                  CustomSummary(
                    landingtitle: 'Export',
                    widthRatio: cardWidth,
                    icon: Symbols.weight,
                    child: CustomQuantityComparing(
                      mainTitle: NumberFormat.decimalPattern()
                          .format(widget.loadingDetailsSummaryEntity.export),
                    ),
                  ),
                  CustomSummary(
                    landingtitle: 'Total',
                    widthRatio: cardWidth,
                    icon: Symbols.weight,
                    child: CustomQuantityComparing(
                      mainTitle: NumberFormat.decimalPattern()
                          .format(widget.loadingDetailsSummaryEntity.total),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            color: const Color(0xfff0f7ec),
            onPressed: _scrollRight,
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                color: Colors.green,
                width: 1.5,
              ),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.green,
            ),
          ),
        ],
      );
    });
   
  }
}

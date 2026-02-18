import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';
import 'package:wncc_portal/features/reports/pending/presentation/manager/pending_cubit/pending_cubit.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pending_table.dart';

class PendingSection extends StatefulWidget {
  const PendingSection({super.key});

  @override
  State<PendingSection> createState() => _PendingSectionState();
}

class _PendingSectionState extends State<PendingSection> {
  int activeTab = 0;
  bool openCharts = false;
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<PendingCubit, PendingState>(
      builder: (context, state) {
        if (state is PendingSuccess) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomToggleButton(
                              onToggle: (value) =>
                                  setState(() => openCharts = value)),
                          (openCharts)
                              ? const SizedBox()
                              : CustomPlaceholderInput(
                                  labelText: 'OrderNo',
                                  width: MediaQuery.of(context).size.width * .4,
                                  icon: const Icon(
                                    Symbols.document_search,
                                    color: Colors.grey,
                                  ),
                                  onChanged: (value) {
                                    searchText = value;
                                    setState(() {});
                                  },
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (openCharts)
                        PendingTable(
                          showCharts: openCharts,
                          pendingData: state.pendingDelivery,
                          searchString: searchText,
                        )
                      else
                        SizedBox(
                          height:
                              orientation == Orientation.landscape ? 400 : 600,
                          child: PendingTable(
                            showCharts: openCharts,
                            pendingData: state.pendingDelivery,
                            searchString: searchText,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is PendingFailure) {
          return Center(child: Text(state.error));
        }
        return const DetailsLoading();
      },
    );
  }
}

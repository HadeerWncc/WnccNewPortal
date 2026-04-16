import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_delivery_summary_cubit/get_delivery_summary_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_submit_pending_buttons.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/pending_delivery_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';

class PendingDeliverySection extends StatefulWidget {
  const PendingDeliverySection({
    super.key,
  });
  @override
  State<PendingDeliverySection> createState() => _PendingDeliverySectionState();
}

class _PendingDeliverySectionState extends State<PendingDeliverySection> {
  final TextEditingController payerController = TextEditingController();
  String sales = "All";
  String product = "All";
  String region = "All";
  int? categoryType;
  List<String> selectedOrders = [];
  DateTime priorityDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDeliveryCubit, GetAllDeliveryState>(
      builder: (context, state) {
        if (state is GetAllPendingDeliverySuccess) {
          List<PriorityDeliveryModel> pendingData = categoryType == 0
              ? state.pendingOrders
                  .where(
                      (p) => p.materialDescription?.contains("معبأ") ?? false)
                  .toList()
              : categoryType == 1
                  ? state.pendingOrders
                      .where((p) => !p.materialDescription!.contains("معبأ"))
                      .toList()
                  : state.pendingOrders;
          if (payerController.text != "") {
            pendingData = pendingData
                .where((p) => p.customerId!.contains(payerController.text))
                .toList();
          }
          if (sales != "All") {
            pendingData =
                pendingData.where((p) => p.salesName == sales).toList();
          }
          // else{
          //   BlocProvider.of<GetDeliverySummaryCubit>(context)
          //       .getDeliverySummary(
          //     GetSummaryEntity(
          //       date: DateTime.now(),
          //       salesId: "",
          //       regionId: "",
          //       matrialId: "",
          //     ),
          //   );
          // }
          if (region != "All") {
            pendingData = pendingData
                .where((p) => p.branchRegionDescription == region)
                .toList();
           
          }
          if (product != "All") {
            pendingData = pendingData
                .where((p) => p.materialDescription!.contains(product))
                .toList();
          }
          if (sales == "All" && product == "All") {
            // BlocProvider.of<GetDeliverySummaryCubit>(context)
            //     .getDeliverySummary(
            //   GetSummaryEntity(
            //     date: DateTime.now(),
            //     salesId: "",
            //     regionId: "",
            //     matrialId: "",
            //   ),
            // );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterDataInputs(
                payerController: payerController,
                selectedSales: sales,
                selectedRegion: region,
                selectedProduct: product,
                salesNames: [
                  "All",
                  ...state.pendingOrders.map((p) => p.salesName ?? "").toSet()
                ],
                regions: [
                  "All",
                  ...state.pendingOrders
                      .map((p) => p.branchRegionDescription ?? "")
                      .toSet()
                ],
                onFilter: (payer, sales, region, product) {
                  payerController.text = payer;
                  this.sales = sales;
                  this.region = region;
                  this.product = product;

                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              // DividerLine(),
              DatePicker(
                title: "Select Priority Date",
                onChange: (value) {
                  priorityDate = value;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: CustomSubmitPendingButtons(
                  selectedOrders: selectedOrders,
                  priorityDate: priorityDate,
                ),
              ),
              const SizedBox(height: 30),
              SelectProductRadioButtonItem(
                onChange: (value) {
                  categoryType = value == "Bags"
                      ? 0
                      : value == "Bulk"
                          ? 1
                          : null;
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              PendingDeliveryTable(
                onSelectOrders: (ordersId) {
                  selectedOrders = ordersId;
                  setState(() {});
                },
                pendingOrders: pendingData,
                priorityDate: priorityDate,
              )
            ],
          );
        } else if (state is GetAllDeliveryFailure) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const PriorityLoading();
      },
    );
  }
}

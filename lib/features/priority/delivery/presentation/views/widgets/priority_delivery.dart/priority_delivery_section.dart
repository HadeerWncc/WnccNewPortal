import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/custom_submit_priority_buttons.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/priority_delivery_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';

class PriorityDeliverySection extends StatefulWidget {
  const PriorityDeliverySection({super.key, required this.user});
  final UserModel user;
  @override
  State<PriorityDeliverySection> createState() =>
      _PriorityDeliverySectionState();
}

class _PriorityDeliverySectionState extends State<PriorityDeliverySection> {
  final TextEditingController payerController = TextEditingController();
  String sales = "All";
  String product = "All";
  String region = "All";
  int? categoryType;
  List<DispatchDeliveryEntity> selectedOrders = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDeliveryCubit, GetAllDeliveryState>(
      builder: (context, state) {
        if (state is GetAllPriorityDeliverySuccess) {
          List<PriorityDeliveryModel> priorityData = categoryType == 0
              ? state.priorityOrders
                  .where(
                      (p) => p.materialDescription?.contains("معبأ") ?? false)
                  .toList()
              : categoryType == 1
                  ? state.priorityOrders
                      .where((p) => !p.materialDescription!.contains("معبأ"))
                      .toList()
                  : state.priorityOrders;
          if (payerController.text != "") {
            priorityData = priorityData
                .where((p) => p.customerId!.contains(payerController.text))
                .toList();
          }
          if (sales != "All") {
            priorityData =
                priorityData.where((p) => p.salesName == sales).toList();
          }
          if (region != "All") {
            priorityData = priorityData
                .where((p) => p.branchRegionDescription == region)
                .toList();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterDataInputs(
                payerController: payerController,
                selectedSales: sales,
                selectedRegion: region,
                selectedProduct: product,
                onFilter: (payer, sales, region, product) {
                  setState(() {
                    payerController.text = payer;
                    this.sales = sales;
                    this.region = region;
                    this.product = product;
                  });
                },
                salesNames: [
                  "All",
                  ...state.priorityOrders.map((p) => p.salesName ?? "").toSet()
                ],
                regions: [
                  "All",
                  ...state.priorityOrders
                      .map((p) => p.branchRegionDescription ?? "")
                      .toSet()
                ],
              ),
              const SizedBox(height: 20),
              // DividerLine(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomSubmitPriorityButtons(
                  selectedOrders: selectedOrders,
                  user: widget.user,
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
              // Show bulk orders
              PriorityDeliveryTable(
                user: widget.user,
                onSelectOrders: (ordersId) {
                  selectedOrders = ordersId;
                  setState(() {});
                },
                priorityOrders: priorityData,
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
        } else {
          return const PriorityLoading();
        }
      },
    );
  }
}

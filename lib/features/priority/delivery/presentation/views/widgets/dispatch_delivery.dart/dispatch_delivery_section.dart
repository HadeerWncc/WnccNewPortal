import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_submit_dispatch_button.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';

class DispatchDeliverySection extends StatefulWidget {
  const DispatchDeliverySection(
      {super.key,
      required this.date,
      required this.user});
  final String date;
  final UserModel user;
  @override
  State<DispatchDeliverySection> createState() =>
      _DispatchDeliverySectionState();
}

class _DispatchDeliverySectionState extends State<DispatchDeliverySection> {
  final TextEditingController payerController = TextEditingController();
  String sales = "All";
  String product = "All";
  String region = "All";
  int? categoryType;
  List<String> selectedOrders = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDeliveryCubit, GetAllDeliveryState>(
      builder: (context, state) {
        if (state is GetAllDispatchDeliverySuccess) {
          List<PriorityDeliveryModel> dispatchData = categoryType == 0
              ? state.dispatchedOrders
                  .where(
                      (p) => p.materialDescription?.contains("معبأ") ?? false)
                  .toList()
              : categoryType == 1
                  ? state.dispatchedOrders
                      .where((p) => !p.materialDescription!.contains("معبأ"))
                      .toList()
                  : state.dispatchedOrders;
          if (payerController.text != "") {
            dispatchData = dispatchData
                .where((p) => p.customerId!.contains(payerController.text))
                .toList();
          }
          if (sales != "All") {
            dispatchData =
                dispatchData.where((p) => p.salesName == sales).toList();
          }
          if (region != "All") {
            dispatchData = dispatchData
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
                  ...state.dispatchedOrders
                      .map((p) => p.salesName ?? "")
                      .toSet()
                ],
                regions: [
                  "All",
                  ...state.dispatchedOrders
                      .map((p) => p.branchRegionDescription ?? "")
                      .toSet()
                ],
              ),
              const SizedBox(height: 20),
              // DividerLine(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomSubmitDispatchButton(
                  selectedOrders: selectedOrders,
                  date: widget.date,
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
              DispatchDeliveryTable(
                onSelectOrders: (ordersId) {
                  selectedOrders = ordersId;
                  setState(() {});
                },
                dispatchedOrders: dispatchData,
                user: widget.user,
              ),
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

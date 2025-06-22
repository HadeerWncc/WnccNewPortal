import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/custom_submit_priority_buttons.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/priority_delivery_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';

class PriorityDeliverySection extends StatefulWidget {
  const PriorityDeliverySection({super.key});

  @override
  State<PriorityDeliverySection> createState() =>
      _PriorityDeliverySectionState();
}

class _PriorityDeliverySectionState extends State<PriorityDeliverySection> {
  final TextEditingController payerController = TextEditingController();
  String sales = "All";
  String product = "All";
  String region = "All";
  String categoryType = "All";
  List<String> selectedOrders = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDeliveryCubit, GetAllDeliveryState>(
      builder: (context, state) {
        if (state is GetAllPriorityDeliverySuccess) {
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
              ),
              const SizedBox(height: 20),
              // DividerLine(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomSubmitPriorityButtons(
                  selectedOrders: selectedOrders,
                ),
              ),
              const SizedBox(height: 30),
              SelectProductRadioButtonItem(
                onChange: (value) {
                  categoryType = value;
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              if (categoryType == "All") // Show all orders
                PriorityDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  priorityOrders: state.priorityOrders,
                )
              else if (categoryType == "Bags") // Show bags orders
                PriorityDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  priorityOrders: state.priorityOrders
                      .where((p) => p.productCategory == 'Bags')
                      .toList(),
                )
              else // Show bulk orders
                PriorityDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  priorityOrders: state.priorityOrders
                      .where((p) => p.productCategory == 'Bulk')
                      .toList(),
                )
            ],
          );
        } else if (state is GetAllDeliveryFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const PriorityLoading();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
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
  String categoryType = "All";
  List<String> selectedOrders = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDeliveryCubit, GetAllDeliveryState>(
      builder: (context, state) {
        if (state is GetAllPendingDeliverySuccess) {
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
                child: CustomSubmitPendingButtons(
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
                PendingDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  pendingOrders: state.pendingOrders,
                )
              else if (categoryType == "Bags") 
                PendingDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  pendingOrders: state.pendingOrders
                      .where((p) => p.productCategory == 'Bags')
                      .toList(),
                )
              else // Show bulk orders
                PendingDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  pendingOrders: state.pendingOrders
                      .where((p) => p.productCategory == 'Bulk')
                      .toList(),
                )
            ],
          );
        } else if (state is GetAllDeliveryFailure) {
          return Center(
            child: Text(state.error),
          );
        }
        return const PriorityLoading();
      },
    );
  }
}

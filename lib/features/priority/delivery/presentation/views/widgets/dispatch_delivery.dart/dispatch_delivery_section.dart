import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_submit_dispatch_button.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';

class DispatchDeliverySection extends StatefulWidget {
  const DispatchDeliverySection({super.key});

  @override
  State<DispatchDeliverySection> createState() =>
      _DispatchDeliverySectionState();
}

class _DispatchDeliverySectionState extends State<DispatchDeliverySection> {
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
        if (state is GetAllDispatchDeliverySuccess) {
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
                child: CustomSubmitDispatchButton(
                  selectedOrders: selectedOrders,
                  date: state.dispatchedOrders.isNotEmpty
                      ? DateFormat('MMMM d, y').format(
                          state.dispatchedOrders[0].dispatchDate ??
                              DateTime.now())
                      : DateFormat('MMMM d, y').format(DateTime.now()),
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
                DispatchDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  dispatchedOrders: state.dispatchedOrders,
                )
              else if (categoryType == "Bags") // Show bags orders
                DispatchDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  dispatchedOrders: state.dispatchedOrders
                      .where((d) => d.productCategory == 'Bags')
                      .toList(),
                )
              else // Show bulk orders
                DispatchDeliveryTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  dispatchedOrders: state.dispatchedOrders
                      .where((d) => d.productCategory == 'Bulk')
                      .toList(),
                ),
            ],
          );
        } else if (state is GetAllDeliveryFailure) {
          return Center(
            child: Text(state.error,style: const TextStyle(color: Colors.red),),
          );
        } else {
          return const PriorityLoading();
        }
      },
    );
  }
}

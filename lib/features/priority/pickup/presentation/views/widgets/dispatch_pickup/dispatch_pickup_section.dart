import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/dispatch_pickup/dispatch_pickup_table.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/dispatch_pickup/submit_dispatch_pickup_buttons.dart';

class DispatchPickupSection extends StatefulWidget {
  const DispatchPickupSection({super.key});

  @override
  State<DispatchPickupSection> createState() => _DispatchPickupSectionState();
}

class _DispatchPickupSectionState extends State<DispatchPickupSection> {
  final TextEditingController payerController = TextEditingController();
  final String sales = "All";
  final String product = "All";
  final String region = "All";
  String categoryType = "All";
  List<String> selectedOrders = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallPickupCubit, GetallPickupState>(
      builder: (context, state) {
        if (state is GetallPickupFailure) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is GetallDispatchPickupSuccess) {
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
                    sales = sales;
                    region = region;
                    product = product;
                  });
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SubmitDispatchPickupButtons(
                  selectedOrders: selectedOrders,
                  date: state.dispatchPickupOrders.isNotEmpty
                      ? DateFormat('yyyy-MM-dd').format(
                          state.dispatchPickupOrders[0].dispatchDate ??
                              DateTime.now())
                      : DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
                DispatchPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.dispatchPickupOrders,
                )
              else if (categoryType == "Bags") // Show bags orders
                DispatchPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.dispatchPickupOrders
                      .where((order) => order.product?.category == "Bags")
                      .toList(),
                )
              else // Show bulk orders
                DispatchPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.dispatchPickupOrders
                      .where((order) => order.product?.category == "Bulk")
                      .toList(),
                ),
            ],
          );
        }
        return const PriorityLoading();
      },
    );
  }
}

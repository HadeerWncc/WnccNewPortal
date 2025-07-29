import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/priority_pickup/priority_pickup_submit_buttons.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/priority_pickup/priority_pickup_table.dart';

class PriorityPickupSection extends StatefulWidget {
  const PriorityPickupSection({super.key});

  @override
  State<PriorityPickupSection> createState() => _PriorityPickupSectionState();
}

class _PriorityPickupSectionState extends State<PriorityPickupSection> {
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
        } else if (state is GetallPriorityPickupSuccess) {
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
              // DividerLine(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: PriorityPickupSubmitButtons(
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
                PriorityPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.priorityPickupOrders,
                )
              else if (categoryType == "Bags") // Show bags orders
                PriorityPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.priorityPickupOrders
                      .where((order) => order.productCategory == "Bags")
                      .toList(),
                )
              else // Show bulk orders
                PriorityPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.priorityPickupOrders
                      .where((order) => order.productCategory == "Bulk")
                      .toList(),
                )
            ],
          );
        }
        return const PriorityLoading();
      },
    );
  }
}

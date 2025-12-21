import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/comm/widgets/filter_data_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/comm/widgets/select_product_radio_button_item.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pending_pickup/custom_submit_pending_pickup_button.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pending_pickup/pending_pickup_table.dart';

class PendingPickupSection extends StatefulWidget {
  const PendingPickupSection({
    super.key,
  });

  @override
  State<PendingPickupSection> createState() => _PendingPickupSectionState();
}

class _PendingPickupSectionState extends State<PendingPickupSection> {
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
          return Center(child: Text(state.errorMessage));
        } else if (state is GetallPendingPickupSuccess) {
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
                child: CustomSubmitPendingPickupButton(
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
                PendingPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.pendingPickupOrders,
                )
              else if (categoryType == "Bags") // Show bags orders
                PendingPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.pendingPickupOrders
                      .where((order) => order.product?.category == "Bags")
                      .toList(),
                )
              else //show bulk orders
                PendingPickupTable(
                  onSelectOrders: (ordersId) {
                    selectedOrders = ordersId;
                    setState(() {});
                  },
                  orders: state.pendingPickupOrders
                      .where((order) => order.product?.category == "Bulk")
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

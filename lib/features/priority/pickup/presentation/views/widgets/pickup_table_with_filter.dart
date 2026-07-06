import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_loading.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/priority_summary_loading.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/totals_pickup.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/pickuplity_item_entity.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickup_summary_cubit/get_pickup_summary_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickupility_cubit/get_pickupility_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/set_pickup_priority_cubit/set_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/helper/get_status.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/filter_pickup_data_inputs.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pickup_priority_table.dart';

class PickupTableWithFilter extends StatefulWidget {
  const PickupTableWithFilter(
      {super.key, required this.user, required this.date});
  final DateTime date;
  final UserModel user;
  @override
  State<PickupTableWithFilter> createState() => _PickupTableWithFilterState();
}

class _PickupTableWithFilterState extends State<PickupTableWithFilter> {
  final TextEditingController payerController = TextEditingController();
  String sales = "All";
  String region = "All";
  List<String> product = [];
  String status = "All";
  List<PickuplityItemEntity> selectedOrders = [];
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPickupilityCubit, GetPickupilityState>(
      builder: (context, state) {
        if (state is GetPickupilitySuccess) {
          List<PickupModel> pickupDate = state.pickupList;
          if (sales != "All") {
            pickupDate = pickupDate.where((p) => p.salesName == sales).toList();
            BlocProvider.of<GetPickupSummaryCubit>(context).getPickupSummary(
              GetSummaryEntity(
                  date: widget.date,
                  salesId: pickupDate[0].salesId,
                  regionId: "",
                  matrialId: ""),
            );
          }
          if (product.isNotEmpty) {
            pickupDate = pickupDate
                .map((item) {
                  // var selectedIds = product.map((e) => e.matrialId).toSet();

                  var filteredProducts = item.pickupilityProducts!
                      .where((prod) => product.contains(prod.materialName))
                      .toList();
                  if (filteredProducts.isEmpty) return null;

                  return PickupModel(
                    date: item.date,
                    customerId: item.customerId,
                    customerName: item.customerName,
                    salesId: item.salesId,
                    salesName: item.salesName,
                    totalQuantity: TotalsPickup(
                      bags: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.quantity ?? 0),
                      ),
                      bulk: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.quantity ?? 0),
                      ),
                      total: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.quantity ?? 0),
                      ),
                    ),
                    totalPriorited: TotalsPickup(
                      bags: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.prioritedQnty ?? 0),
                      ),
                      bulk: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.prioritedQnty ?? 0),
                      ),
                      total: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.prioritedQnty ?? 0),
                      ),
                    ),
                    totalDispatched: TotalsPickup(
                      bags: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.dispatchedQnty ?? 0),
                      ),
                      bulk: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.dispatchedQnty ?? 0),
                      ),
                      total: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.dispatchedQnty ?? 0),
                      ),
                    ),
                    totalRemaining: TotalsPickup(
                      bags: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.remainingQnty ?? 0),
                      ),
                      bulk: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.remainingQnty ?? 0),
                      ),
                      total: filteredProducts.fold(
                        0,
                        (sum, item) => (sum ?? 0) + (item.remainingQnty ?? 0),
                      ),
                    ),
                    status: getStatus(filteredProducts),
                    pickupilityProducts: filteredProducts,
                  );
                })
                .where((item) => item != null)
                .cast<PickupModel>()
                .toList();
            pickupDate.sort((a, b) {
              final aIndex = statusOrder[a.status] ?? 999;
              final bIndex = statusOrder[b.status] ?? 999;
              return aIndex.compareTo(bIndex);
            });
            // BlocProvider.of<GetPickupSummaryCubit>(context).getPickupSummary(
            //     GetSummaryEntity(
            //         date: widget.date,
            //         salesId: pickupDate[0].salesId,
            //         regionId: "",
            //         matrialId: ""));
          }
          if (payerController.text != "") {
            pickupDate = pickupDate
                .where((p) => p.customerId!.contains(payerController.text))
                .toList();
          }
          if (status != "All") {
            pickupDate = pickupDate.where((p) => p.status == status).toList();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GetPickupSummaryCubit, GetPickupSummaryState>(
                builder: (context, state) {
                  if (state is GetPickupSummarySuccess) {
                    return PrioritySummary(
                      prioritySummary: state.prioritySummaryModel,
                    );
                  } else {
                    return const PrioritySummaryLoading();
                  }
                },
              ),
              const SizedBox(height: 5),
              FilterPickupDataInputs(
                payerController: payerController,
                selectedSales: sales,
                selectedProduct: product,
                selectedStatus: status,
                onFilter:
                    (payer, selectedsales, selectedProduct, selectedStatus) {
                  setState(() {
                    payerController.text = payer;
                    sales = selectedsales;
                    product = selectedProduct;
                    status = selectedStatus;
                  });
                },
                salesNames: [
                  "All",
                  ...state.pickupList.map((p) => p.salesName ?? "").toSet()
                ],
                products: [
                  ...state.pickupList
                      .expand((p) => p.pickupilityProducts ?? [])
                      .map((m) => m.materialName)
                      .toSet(),
                ],
                status: [
                  "All",
                  ...state.pickupList.map((e) => e.status ?? "").toSet()
                ],
              ),
              const SizedBox(height: 20),
              // DividerLine(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: CustomSubmitUpdatePickupPriority(
              //     makePickupility: makePickupilityEntity,
              //     date: widget.date,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    BlocConsumer<SetPickupPriorityCubit,
                        SetPickupPriorityState>(
                      listener: (context, state) {
                        if (state is SetPickupPrioritySuccess) {
                          ShowSnackbar.showSnackBar(
                              context, state.successMsg, 'S');
                          selectedOrders.clear();

                          BlocProvider.of<GetPickupilityCubit>(context)
                              .getAllPickup(widget.date);

                          setState(() {});
                        } else if (state is SetPickupPriorityFailure) {
                          ShowSnackbar.showSnackBar(
                              context, state.errorMsg, 'F');
                        }
                      },
                      builder: (context, state) {
                        if (state is SetPickupPriorityLoading) {
                          return const CustomButtonWithIcon(
                            child: "Save Changes",
                            textColor: Colors.white,
                            bgColor: Color.fromARGB(255, 244, 157, 96),
                            onHoverColor: Color.fromARGB(255, 248, 150, 80),
                            icon: Symbols.save,
                            onTap: null,
                          );
                        }
                        return selectedOrders.isNotEmpty
                            ? CustomButtonWithIcon(
                                child: "Save Changes",
                                textColor: Colors.white,
                                bgColor: const Color(0xfff97316),
                                onHoverColor:
                                    const Color.fromARGB(255, 248, 150, 80),
                                icon: Symbols.save,
                                onTap: () {
                                  bool hasError = selectedOrders.any(
                                    (o) =>
                                        (o.dispatchQuantity ?? 0) >
                                        (o.priorityQuantity ?? 0),
                                  );
                                  if (hasError) {
                                    ShowSnackbar.showSnackBar(
                                      context,
                                      "Error: Dispatch quantity cannot be greater than Priority quantity!",
                                      'F',
                                    );
                                    return;
                                  }
                                  BlocProvider.of<SetPickupPriorityCubit>(
                                          context)
                                      .setPickupPriority(
                                    MakePickupilityEntity(
                                      pickuplityItems: selectedOrders,
                                      date: widget.date,
                                    ),
                                  );
                                },
                              )
                            : const CustomButtonWithIcon(
                                child: "Save Changes",
                                textColor: Colors.white,
                                bgColor: Color.fromARGB(255, 244, 157, 96),
                                onHoverColor: Color.fromARGB(255, 248, 150, 80),
                                icon: Symbols.save,
                                onTap: null,
                              );
                      },
                    )
                  ],
                ),
              ),
              PickupPriorityTable(
                onSelectOrders: (picDate) {
                  selectedOrders = picDate;
                  setState(() {});
                },
                user: widget.user,
                pickupOrders: pickupDate,
              )
            ],
          );
        } else if (state is GetPickupilityFailure) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Column(
            children: [
              PrioritySummaryLoading(),
              SizedBox(
                height: 10,
              ),
              PriorityLoading(),
            ],
          );
        }
      },
    );
  }
}

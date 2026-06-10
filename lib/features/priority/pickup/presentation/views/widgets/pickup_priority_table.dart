import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickupility_product.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/pickuplity_item_entity.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/helper/get_key.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/custom_pickup_data_cell_checkbox.dart';

class PickupPriorityTable extends StatefulWidget {
  final List<PickupModel> pickupOrders;
  final Function(List<PickuplityItemEntity> ordersId) onSelectOrders;
  final UserModel user;
  const PickupPriorityTable(
      {super.key,
      required this.pickupOrders,
      required this.onSelectOrders,
      required this.user});

  @override
  State<PickupPriorityTable> createState() => _PickupPriorityTableState();
}

class _PickupPriorityTableState extends State<PickupPriorityTable> {
  final Map<String, bool> _expandedPayers = {};
  // List<PickuplityItemEntity> orders = [];
  List<String> selectedKeys = [];
  final Map<String, TextEditingController> prioritiesController = {};
  final Map<String, TextEditingController> dispatchesController = {};
  @override
  Widget build(BuildContext context) {
    Map<String, List<PickupModel>> grouped = {};
    for (var order in widget.pickupOrders) {
      grouped.putIfAbsent(order.customerName ?? "", () => []).add(order);
    }
    // return SizedBox();
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1400, // Set a fixed width for the table
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderRow(),
                const Divider(
                  height: .5,
                  color: Color.fromARGB(255, 226, 226, 226),
                ),
                ...widget.pickupOrders.map((order) {
                  final payer = order.customerName;
                  // final orders = entry.value;
                  // final payerTotal = entry.value
                  //     .fold<num>(0, (sum, order) => sum + (order.));
                  final isExpanded = _expandedPayers[payer] ?? false;
      
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _expandedPayers[payer!] = !isExpanded;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 237, 237, 238),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(isExpanded
                                    ? Symbols.keyboard_arrow_down
                                    : Symbols.keyboard_arrow_right),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                      child: Text(order.customerId.toString()))),
                              Expanded(
                                  flex: 5,
                                  child: Center(
                                      child: Text(order.customerName ?? ""))),
                              const Expanded(
                                  flex: 4, child: Center(child: Text(""))),
                              // Expanded(
                              //     flex: 3,
                              //     child: Center(
                              //         child: Text(NumberFormat.decimalPattern()
                              //             .format(order.totalQuantity)))),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                      child: Text(NumberFormat.decimalPattern()
                                          .format(order.totalPriorited)))),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                      child: Text(NumberFormat.decimalPattern()
                                          .format(order.totalDispatched)))),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    NumberFormat.decimalPattern()
                                        .format(order.totalRemaining),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: MarkedText(
                                    child: order.status.toString(),
                                    color: order.status == "in-process"
                                        ? const Color(0xffdbeafe)
                                        : order.status == "completed"
                                            ? const Color(0xffd1fae5)
                                            : order.status == "pending"
                                                ? const Color(0xfffff7ed)
                                                : const Color.fromARGB(
                                                    255, 212, 211, 211),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                      child: Text(order.salesName.toString()))),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded)
                        ...order.pickupilityProducts!
                            .asMap()
                            .entries
                            .map((entry) {
                          var o = entry.value;
                          final id = getKey(o);
      
                          prioritiesController.putIfAbsent(
                            id,
                            () => TextEditingController(
                              text: NumberFormat.decimalPattern()
                                  .format(o.prioritedQnty),
                            ),
                          );
      
                          dispatchesController.putIfAbsent(
                            id,
                            () => TextEditingController(
                              text: NumberFormat.decimalPattern()
                                  .format(o.dispatchedQnty),
                            ),
                          );
                          return _buildDataRow(
                            o,
                            prioritiesController[id]!,
                            dispatchesController[id]!,
                          );
                        }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: const BoxDecoration(
          color: kBtnColor,
          border: Border(
              top: BorderSide(
                  color: Color.fromARGB(255, 163, 160, 160), width: 1))),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                'Code',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 5,
              child: Center(
                  child: Text(
                'Customer Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 4,
              child: Center(
                  child: Text(
                'Matrial',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          // Expanded(
          //     flex: 3,
          //     child: Center(
          //         child: Text(
          //       'Total Qnty',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16,
          //           color: Colors.white),
          //     ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Total Pr.Qnty',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Total Dis.Qnty',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Total Rem.Qnty',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Status',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Sales',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
        ],
      ),
    );
  }

  void _notifyParent() {
    final result = selectedKeys.map((key) {
      final parts = key.split('_');

      return PickuplityItemEntity(
        customerId: parts[0],
        salesId: parts[1],
        materialId: parts[2],
        priorityQuantity: parseToInt(prioritiesController[key]?.text),
        dispatchQuantity: parseToInt(dispatchesController[key]?.text),
      );
    }).toList();

    widget.onSelectOrders(result);
  }

  Widget _buildDataRow(
      PickupilityProduct order,
      TextEditingController priorityController,
      TextEditingController dispatchController) {
    // priorityController.text =
    //     NumberFormat.decimalPattern().format(order.prioritedQnty);
    // dispatchController.text =
    //     NumberFormat.decimalPattern().format(order.dispatchedQnty);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomPickupDataCellCheckbox(
              pickupOrderId: order,
              onChanged: (value) {
                // save orderId
                final key = getKey(order);
                setState(() {
                  if (value == true) {
                    selectedKeys.add(key);
                  } else {
                    selectedKeys.remove(key);
                  }
                });

                _notifyParent();
              },
            ),
          ),
          const Expanded(flex: 2, child: Center(child: Text(""))),
          const Expanded(flex: 5, child: Center(child: Text(""))),
          Expanded(
              flex: 4,
              child: Center(child: Text(order.materialName.toString()))),
          // Expanded(
          //   flex: 3,
          //   child: Center(
          //     child: Text(
          //       NumberFormat.decimalPattern().format(order.quantity),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: Center(
              child: widget.user.position == "Dispatch Coordinator"
                  ? Text(
                      NumberFormat.decimalPattern().format(order.prioritedQnty),
                    )
                  : CustomInputTable(
                      controller: priorityController,
                      onChanged: (_) {
                        _notifyParent();
                      },
                    ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: (widget.user.position == "Sales Agent" ||
                      widget.user.position == "Sales Area Manager")
                  ? Text(
                      NumberFormat.decimalPattern()
                          .format(order.dispatchedQnty),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: CustomInputTable(
                            // controller: dispatchController,
                            onChanged: (value) {
                              dispatchController.text =
                                  (parseToInt(order.dispatchedQnty.toString()) +
                                          parseToInt(value))
                                      .toString();
                              _notifyParent();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(dispatchController.text)
                      ],
                    ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                NumberFormat.decimalPattern().format(order.remainingQnty),
              ),
            ),
          ),
          const Expanded(flex: 3, child: Center(child: Text(""))),
          const Expanded(flex: 3, child: Center(child: Text(""))),
        ],
      ),
    );
  }
}

class CustomInputTable extends StatelessWidget {
  const CustomInputTable({
    super.key,
    this.controller,
    this.onChanged,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
          keyboardType: const TextInputType.numberWithOptions(),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: controller,
          onChanged: onChanged),
    );
  }
}

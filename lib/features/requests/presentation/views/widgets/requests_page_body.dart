import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_state_container.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_pending_delivery_actions.dart';

class RequestsPageBody extends StatelessWidget {
  const RequestsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xfff7f7f7),
            border: Border.all(
              color: const Color.fromARGB(255, 208, 210, 210),
              width: .9,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: MediaQuery.of(context).size.width * .2,
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(8),
                  image:  DecorationImage(
                      image: AssetImage('assets/images/requestImage.jpeg'),
                      fit: BoxFit.fill,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                contant: 'Create new request',
                color: kBtnColor,
                onTap: () {},
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPlaceholderInput(
                width: MediaQuery.of(context).size.width * .4,
                controller: TextEditingController(),
                labelText: 'Select Payer',
              ),
              CustomDropDownInput(
                width: MediaQuery.of(context).size.width * .3,
                selectedValue: 'AppPending',
                items: const ['AppPending', 'Pending', 'Delivered', 'Finished'],
                title: 'Status',
                onChanged: (value) {
                  if (value == 'AppPending') {
                    //GetAllData
                  } else {
                    //Get Data With Status filtration
                    //Most get payer Id

                    ShowSnackbar.showSnackBar(
                        context, 'Please Enter Payer Code');
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width < 800
                  ? 800
                  : MediaQuery.of(context).size.width,
              child: DataTable2(
                columnSpacing: 0,
                horizontalMargin: 0,
                minWidth: 800,
                showCheckboxColumn: true,
                dataRowHeight: 60,
                border: const TableBorder.symmetric(
                    outside:
                        BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xffF9FAFC),
                ),
                columns: const [
                  DataColumn(label: DataColumnText(text: 'Payer')),
                  DataColumn(label: DataColumnText(text: 'Level')),
                  DataColumn(label: DataColumnText(text: 'Status')),
                  DataColumn(label: DataColumnText(text: 'No')),
                  DataColumn(label: DataColumnText(text: 'Created At')),
                  DataColumn(label: DataColumnText(text: 'Actions')),
                ],
                rows: List<DataRow>.generate(
                  20,
                  (index) {
                    final color = index.isOdd
                        ? const Color(0xffF8F8FA)
                        : const Color(0xffFFFFFF);
                    // final item = widget.pendingOrders[index];
                    return DataRow(
                        color: WidgetStateProperty.all(color),
                        cells: const [
                          DataCell(CustomDataCellWidget(
                              title: "Ahmed Ali", subTitle: "1000049")),
                          DataCell(
                            Center(
                              child: CustomStateContainer(
                                title: 'Critical',
                                color: Color.fromARGB(255, 18, 159, 22),
                                bgColor: Color(0xffD9FDE3),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: CustomStateContainer(
                                title: 'New',
                                color: Color.fromARGB(255, 0, 139, 253),
                                bgColor: Color.fromARGB(255, 223, 236, 248),
                              ),
                            ),
                          ),
                          DataCell(Center(
                              child: Text(
                            '145236',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                          DataCell(CustomDataCellWidget(
                              title: "Apr 20 2025", subTitle: "time: 12:30}")),
                          DataCell(
                            CustomPendingDeliveryActions(
                              orderId: '14',
                            ),
                          ),
                        ]);
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

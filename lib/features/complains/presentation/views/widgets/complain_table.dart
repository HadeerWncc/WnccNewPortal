import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/custom_complain_actions.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class ComplainTable extends StatelessWidget {
  const ComplainTable({super.key, required this.complains, required this.user});

  final List<ComplainEntity> complains;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
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
                outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
            headingRowColor: WidgetStateProperty.all(
              const Color(0xffF9FAFC),
            ),
            columns: const [
              DataColumn(label: DataColumnText(text: 'Id')),
              DataColumn(label: DataColumnText(text: 'Payer')),
              DataColumn(label: DataColumnText(text: 'Subject')),
              // DataColumn(label: DataColumnText(text: 'Status')),
              DataColumn(label: DataColumnText(text: 'Actions')),
            ],
            rows: List<DataRow>.generate(
              complains.length,
              (index) {
                final color = index.isOdd
                    ? const Color(0xffF8F8FA)
                    : const Color(0xffFFFFFF);
                return DataRow(
                  onSelectChanged: (value) {
                    // getBlocProviders(context, index);
                    // goToDetailsPage(context, index);
                    GoRouter.of(context)
                        .push(AppRouter.complainDetailsPage, extra: {
                      "complainId": complains[index].id,
                      "user": user,
                    });
                  },
                  color: WidgetStateProperty.all(color),
                  cells: [
                    DataCell(
                      Center(
                        child: Text(
                          complains[index].id!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataCell(CustomDataCellWidget(
                        title: complains[index].payerName!,
                        subTitle: complains[index].payerId!)),
                    DataCell(
                      Center(
                        child: Text(
                          complains[index].description!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataCell(
                      CustomComplainActions(
                        complainId: complains[index].id!,
                        payerId: complains[index].payerId!,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_replies_cubit/request_replies_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/custom_request_actions.dart';

class RequestsTable extends StatelessWidget {
  const RequestsTable({
    super.key,
    required this.requests,
    required this.user,
  });
  final List<RequestEntity> requests;
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
            showCheckboxColumn: false,
            columnSpacing: 0,
            horizontalMargin: 0,
            minWidth: 800,
            dataRowHeight: 60,
            border: const TableBorder.symmetric(
                outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
            headingRowColor: WidgetStateProperty.all(
              const Color(0xffF9FAFC),
            ),
            columns: const [
              DataColumn(label: DataColumnText(text: 'ID')),
              DataColumn(label: DataColumnText(text: 'Payer')),
              DataColumn(label: DataColumnText(text: 'Level')),
              DataColumn(label: DataColumnText(text: 'Status')),
              DataColumn(label: DataColumnText(text: 'Created At')),
              DataColumn(label: DataColumnText(text: 'Actions')),
            ],
            rows: List<DataRow>.generate(
              requests.length,
              (index) {
                final color = index.isOdd
                    ? const Color(0xffF8F8FA)
                    : const Color(0xffFFFFFF);
                return DataRow(
                  onSelectChanged: (value) {
                    getBlocProviders(context, index);
                    goToDetailsPage(context, index);
                  },
                  color: WidgetStateProperty.all(color),
                  cells: [
                    DataCell(
                      Center(
                        child: Text(
                          requests[index].id.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      CustomDataCellWidget(
                          title: requests[index].payerName!,
                          subTitle: requests[index].payerId.toString()),
                    ),
                    DataCell(
                      Center(
                        child: CustomMarkedColorContainer(
                          title: getRequestLevelText(requests[index].level),
                          color: const Color.fromARGB(255, 18, 159, 22),
                          bgColor: const Color(0xffD9FDE3),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: CustomMarkedColorContainer(
                          title: getRequestStatusText(requests[index].status),
                          color: const Color.fromARGB(255, 0, 139, 253),
                          bgColor: const Color.fromARGB(255, 223, 236, 248),
                        ),
                      ),
                    ),
                    DataCell(
                      CustomDataCellWidget(
                        title: DateFormat('MMM dd, yyyy')
                            .format(requests[index].createdAt!),
                        subTitle: DateFormat('hh:mm')
                            .format(requests[index].createdAt!),
                      ),
                    ),
                    DataCell(
                      CustomRequestActions(
                        requestId: requests[index].id.toString(),
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

  void goToDetailsPage(BuildContext context, int index) {
    GoRouter.of(context).push(
      AppRouter.requestDetailsPage,
      extra: {
        'requestId': requests[index].id,
        'user': user,
      },
    );
  }

  void getBlocProviders(BuildContext context, int index) {
    BlocProvider.of<RequestDetailsCubit>(context).openRequest(requests[index].id!);

     BlocProvider.of<ForwardedRequestCubit>(context)
        .getForwardedById(requests[index].id!);
    
     BlocProvider.of<RequestRepliesCubit>(context)
        .getRequestReplies(requests[index].id!);
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wncc_portal/features/reports/loading_details/presentation/manager/loading_details_cubit/loading_details_cubit.dart';
// import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_table_with_filter.dart';
// import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

// class LoadingDetailsTable extends StatelessWidget {
//   const LoadingDetailsTable({
//     super.key,
//     required this.status,
//   });
//   final String status;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoadingDetailsCubit, LoadingDetailsState>(
//       builder: (context, state) {
//         if (state is LoadingDetailsSuccess) {
//           // final tableData = buildTableData(state.payments);
//           return LoadingDetailsTableWithFulter(tableData: state.loadingDetails);
//         } else if (state is LoadingDetailsFailure) {
//           return Center(child: Text(state.errorMsg));
//         }
//         return const PaymentLoaing();
//       },
//     );
//   }
// }

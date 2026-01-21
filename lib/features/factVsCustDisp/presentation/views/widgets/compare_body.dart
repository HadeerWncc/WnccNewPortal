import 'package:flutter/material.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/compare_table.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/section_title.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('Current Year'),
                const SizedBox(height: 8),
                CompareTable(),
                const SizedBox(height: 30),
                sectionTitle('Selected Year'),
                const SizedBox(height: 8),
                CompareTable(),
                const SizedBox(height: 30),
                sectionTitle('Differance'),
                const SizedBox(height: 8),
                CompareTable(),
              ],
            ),
          );
    // return BlocBuilder<FactVsCustCubit, FactVsCubitState>(
    //   builder: (context, state) {
    //     if (state is FactVsCustCubitFailure) {
    //       return const Center(
    //           child: Text('Failed to load data',
    //               style: TextStyle(color: Colors.red)));
    //     } else if (state is FactVsCustCubitSuccess) {
    //       return SingleChildScrollView(
    //         physics: const BouncingScrollPhysics(),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             sectionTitle('Factory (FLS)'),
    //             const SizedBox(height: 8),
    //             buildFactoryTable(
    //               factoryDispatchResponse: state.factVsCustList,
    //               lableName: 'Time',
    //             ),
    //             const SizedBox(height: 30),
    //             sectionTitle('Customer (P&L)'),
    //             const SizedBox(height: 8),
    //             buildCustomerTable(
    //               customerDispatchResponse: state.factVsCustList,
    //               lableName: 'Time',
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/data/models/credit_limit/credit_limit/credit_limit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/credit_limit_cubit/credit_limit_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/credit_limit_table.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';

class CreditLimitSection extends StatefulWidget {
  const CreditLimitSection({super.key});

  @override
  State<CreditLimitSection> createState() => _CreditLimitSectionState();
}

class _CreditLimitSectionState extends State<CreditLimitSection> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<CreditLimitCubit, CreditLimitState>(
      builder: (context, state) {
        if (state is CreditLimitSuccess) {
          List<CreditLimit> sortingCredit = state.creditLimit;
          // sortingCredit
          //     .sort((a, b) => a.amountBalance!.compareTo(b.amountBalance!));
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            orientation == Orientation.landscape ? 400 : 600,
                        child: CreditLimitTable(
                          tableData: sortingCredit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is CreditLimitFailure) {
          return Center(child: Text(state.error));
        }
        return const DetailsLoading();
      },
    );
  }
}

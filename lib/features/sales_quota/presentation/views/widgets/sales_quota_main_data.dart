import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sales_quota_bloc_consumer.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/card_body.dart';

class SalesQuotaMainData extends StatefulWidget {
  const SalesQuotaMainData({
    super.key,
  });

  @override
  State<SalesQuotaMainData> createState() => _SalesQuotaMainDataState();
}

class _SalesQuotaMainDataState extends State<SalesQuotaMainData> {
  DateTime currentDate = DateTime.now(); //First time only
  DateTime copedDate = DateTime.now(); //First time only
  @override
  Widget build(BuildContext context) {
    String stringCurrentDate =
        DateFormat('yyyy-MM-dd').format(currentDate).toString();

    BlocProvider.of<SalesQuotaCubit>(context)
        .getDailyQuotaByDate(stringCurrentDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        CardBody(
          currentDate: currentDate,
          copedDate: copedDate,
          onChangeCurrentDate: (value) {
            setState(() {
              currentDate = value;
            });
          },
          onChangeCopedDate: (value) {
            copedDate = value;
          },
        ),
        const SizedBox(height: 20),
        const DividerLine(),
        SalesQuotaBlocConsumer(currentDate: stringCurrentDate),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/date_picker.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/switch_button.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/copy_data_blocprovider.dart';

class CardBody extends StatefulWidget {
  const CardBody({
    super.key,
    required this.currentDate,
    required this.onChangeCurrentDate,
    required this.onChangeCopedDate,
    required this.copedDate,
  });
  final DateTime currentDate;
  final DateTime copedDate;
  final void Function(DateTime) onChangeCurrentDate;
  final void Function(DateTime) onChangeCopedDate;
  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = widget.currentDate;
    DateTime copedDate = widget.copedDate;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        runSpacing: 15,
        children: [
          DatePicker(
            title: 'Selected Quota Date',
            onChange: (value) {
              currentDate = value;
              widget.onChangeCurrentDate(value);
            },
          ),
          switchState
              ? DatePicker(
                  title: 'Copy Quota Date',
                  onChange: (value) {
                    copedDate = value;
                    widget.onChangeCopedDate(value);
                  },
                )
              : const SizedBox(),
          switchState
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * .32,
                  child: CopyDataBlocProvider(
                    currentDate: currentDate,
                    tryToCopyQuota: tryToCopyQuota,
                  ),
                )
              : const SizedBox(),
          SwitchButton(
            isSwitched: (active) {
              switchState = active;
              setState(() {});
            },
          ),
          // DailyQuotaItemList(
          //   date: currentDate,
          // ),
        ],
      ),
    );
  }

  void tryToCopyQuota(BuildContext context) {
    CopyQuotaDateEntity copyQuotaEntity = CopyQuotaDateEntity(
      date: DateFormat('yyyy-MM-dd').format(widget.copedDate),
      copyToDate: DateFormat('yyyy-MM-dd').format(widget.currentDate),
    );
    context.read<SetQuotaCubit>().copedQuota(copyQuotaEntity: copyQuotaEntity);
  }
}

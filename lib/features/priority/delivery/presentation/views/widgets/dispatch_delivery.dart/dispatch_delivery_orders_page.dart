import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_section.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/get_delivery_summary_bloc_builder.dart';

class DispatchDeliveryOrdersPage extends StatelessWidget {
  const DispatchDeliveryOrdersPage({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    DateTime selectedfromDate =
        DateTime(DateTime.now().year, DateTime.now().month);
    DateTime selectedtoDate = DateTime.now();

    String selectedFromDateString =
        DateFormat('yyyy-MM-dd').format(selectedfromDate).toString();
    String selectedtoDateString =
        DateFormat('yyyy-MM-dd').format(selectedtoDate).toString();
    BlocProvider.of<GetAllDeliveryCubit>(context).getDeliveryDispatchByDate(
        selectedFromDateString, selectedtoDateString);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomRangeDatePicker(
            width: MediaQuery.of(context).size.width * .6,
            title: 'Selected Delivery Date',
            ititialFromDate: selectedfromDate,
            ititialToDate: selectedtoDate,
            onChange: (value) {
              selectedfromDate = value.start;
              selectedtoDate = value.end;
              selectedFromDateString =
                  DateFormat('yyyy-MM-dd').format(selectedfromDate).toString();
              selectedtoDateString =
                  DateFormat('yyyy-MM-dd').format(selectedtoDate).toString();
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getDeliveryDispatchByDate(
                      selectedFromDateString, selectedtoDateString);
            },
          ),
        ),
        // const SizedBox(height: 10),
        const GetDeliverySummaryBlocBuilder(),
        const SizedBox(height: 10),
        const DividerLine(),
        const SizedBox(height: 10),
        DispatchDeliverySection(
          fromDate: selectedFromDateString,
          toDate: selectedtoDateString,
          user: user,
        ),
      ],
    );
  }
}

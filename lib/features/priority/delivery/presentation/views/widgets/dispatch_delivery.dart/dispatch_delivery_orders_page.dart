import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_section.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/get_delivery_summary_bloc_builder.dart';

class DispatchDeliveryOrdersPage extends StatelessWidget {
  const DispatchDeliveryOrdersPage({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    // DateTime selectedfromDate =
    //     DateTime(DateTime.now().year, DateTime.now().month);
    DateTime selectedDate = DateTime.now();

    String selectedDateString =
        DateFormat('yyyy-MM-dd').format(selectedDate).toString();
    // String selectedtoDateString =
    //     DateFormat('yyyy-MM-dd').format(selectedtoDate).toString();
    BlocProvider.of<GetAllDeliveryCubit>(context).getDeliveryDispatchByDate(
      selectedDateString,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 10),
        const GetDeliverySummaryBlocBuilder(),
        Padding(
            padding: const EdgeInsets.all(10),
            child: DatePicker(
              title: 'Selecte Delivery Date',
              onChange: (currentDate) {
                selectedDate = currentDate;
                selectedDateString =
                    DateFormat('yyyy-MM-dd').format(selectedDate).toString();
                // selectedtoDateString =
                //     DateFormat('yyyy-MM-dd').format(selectedtoDate).toString();
                BlocProvider.of<GetAllDeliveryCubit>(context)
                    .getDeliveryDispatchByDate(selectedDateString);
              },
            )),
        const SizedBox(height: 10),
        const DividerLine(),
        const SizedBox(height: 10),
        DispatchDeliverySection(
          date: selectedDateString,
          user: user,
        ),
      ],
    );
  }
}

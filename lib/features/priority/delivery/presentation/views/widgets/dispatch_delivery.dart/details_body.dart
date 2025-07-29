import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_details_heaing.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_details_icon.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: const [
        CustomDetailsHeading(),
        SizedBox(height: 20),
        CustomDetailsItem(
          icon: Icon(
            Symbols.location_on,
            color: Colors.red,
            size: 20,
            weight: 900,
          ),
          title: 'Not Started',
          subTitle: 'The truck still outside.',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.check_circle,
            color: Colors.amber,
            size: 20,
            weight: 900,
          ),
          title: 'Got Shippment No',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.home_pin,
            color: Colors.amber,
            size: 20,
            weight: 900,
          ),
          title: 'Got Checkin Date',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.home_pin,
            color: Colors.blue,
            size: 20,
            weight: 900,
          ),
          title: 'Got Start Loading Date',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.home_pin,
            color: Colors.blue,
            size: 20,
            weight: 900,
          ),
          title: 'Got End Loading Date',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.home_pin,
            color: Colors.blue,
            size: 20,
            weight: 900,
          ),
          title: 'Got Finish Shippment Date',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
        CustomVerticalDivider(),
        CustomDetailsItem(
          icon: Icon(
            Symbols.task_alt,
            color: Colors.green,
            size: 20,
            weight: 900,
          ),
          title: 'Got Living Date',
          subTitle: 'May 8, 2023 10:00 AM',
          processColor: Colors.green,
        ),
      ],
    );
  }
}

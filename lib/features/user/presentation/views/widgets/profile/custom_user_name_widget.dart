import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_state_container.dart';

class CustomUserNameWidget extends StatelessWidget {
  const CustomUserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Admindtrator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 5),
        Icon(
          Icons.verified_sharp,
          color: Colors.blue,
          size: 18,
        ),
        SizedBox(width: 7),
        CustomStateContainer(
          title: "Available",
          color: Colors.green,
          bgColor: Color(0xffD9FDE3),
        ),
      ],
    );
  }
}

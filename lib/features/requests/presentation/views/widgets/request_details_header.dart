import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';

class RequestDetailsHeader extends StatelessWidget {
  const RequestDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                'Payer Request-(11764345)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              CustomMarkedColorContainer(
                title: 'Medium',
                color: Color.fromARGB(255, 0, 139, 253),
                bgColor: Color.fromARGB(255, 223, 236, 248),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Opacity(
                    opacity: .5,
                    child: Text(
                      'Created by:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Adminstrator',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

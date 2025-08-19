import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';

class AddComplainSection extends StatelessWidget {
  const AddComplainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f7),
        border: Border.all(
          color: const Color.fromARGB(255, 208, 210, 210),
          width: .9,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: MediaQuery.of(context).size.width * .2,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.width * .4,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/requestImage.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            contant: 'Create new Complain',
            color: kBtnColor,
            onTap: () {
              GoRouter.of(context).push(AppRouter.createComplainPage);
            },
          ),
        ],
      ),
    );
  }
}

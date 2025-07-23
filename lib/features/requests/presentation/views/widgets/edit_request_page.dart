import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/edit_request_form.dart';

class EditRequestPage extends StatelessWidget {
  const EditRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Edit Request',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Symbols.close,
                      size: 24,
                      weight: 900,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const EditRequestForm(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: CustomButton(
                    contant: 'Discard',
                    color: const Color(0xffF9F9F9),
                    textColor: const Color.fromARGB(255, 57, 57, 57),
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: const CustomButtonWithIcon(
                    child: 'Submit',
                    textColor: Colors.white,
                    bgColor: kBtnColor,
                    icon: Symbols.done_all,
                    onHoverColor: Color.fromARGB(255, 116, 174, 240),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
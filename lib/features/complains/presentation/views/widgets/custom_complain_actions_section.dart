import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/popup_actionds.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/forwarded_complain_cubit/forwarded_complain_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_content_body.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_heading_title.dart';

class CustomComplainActionsSection extends StatelessWidget {
  const CustomComplainActionsSection({super.key, required this.complainId});
  final String complainId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomButtonWithIcon(
                child: 'Forward',
                textColor: Colors.black,
                bgColor: const Color(0xffF9F9F9),
                icon: Symbols.forward,
                onHoverColor: const Color.fromARGB(255, 207, 207, 207),
                onTap: () {
                  forwardPopUp(context, complainId: complainId);
                },
              ),
              const SizedBox(width: 10),
              CustomButtonWithIcon(
                child: 'Follow_up',
                textColor: Colors.black,
                bgColor: const Color(0xffF9F9F9),
                icon: Symbols.inventory,
                onHoverColor: const Color.fromARGB(255, 207, 207, 207),
                onTap: () {},
              ),
            ],
          ),
          CustomButtonWithIcon(
            child: 'Close',
            textColor: Colors.white,
            bgColor: const Color(0xff13C855),
            icon: Symbols.task_alt,
            onHoverColor: const Color.fromARGB(255, 12, 132, 56),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Future<dynamic> forwardPopUp(BuildContext context,
      {required String complainId}) {
    List<String> usersId = [];
    TextEditingController forwardResonController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: Colors.white,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          titlePadding: const EdgeInsets.all(0),
          titleTextStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          title: const PopUpHeadingTitle(headingText: "Forward Complian"),
          content: ForwardedContentBody(
            forwardTextContent: 'Forward the complian to concerned users',
            forwardResonController: forwardResonController,
            onSelectForwardUsers: (values) {
              usersId = values;
            },
          ),
          actions:
              popUpActions(context, submitBtnName: 'Forward', onSubmit: () {
            BlocProvider.of<ForwardedComplainCubit>(context).forwardUsers(
              id: complainId,
              forwardReason: forwardResonController.text,
              forwardedUsers: usersId,
            );
          }),
        );
      },
    );
  }
}

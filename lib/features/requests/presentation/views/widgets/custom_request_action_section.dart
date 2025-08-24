import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/make_sure_dialog.dart';
import 'package:wncc_portal/core/utils/methods/popup_actionds.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/requests/domain/entities/change_request_log_entity.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_content_body.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_heading_title.dart';

class CustomRequestActionSection extends StatelessWidget {
  const CustomRequestActionSection({super.key, required this.requestId});
  final String requestId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonWithIcon(
            child: 'Forward',
            textColor: Colors.black,
            bgColor: const Color(0xffF9F9F9),
            icon: Symbols.forward,
            onHoverColor: const Color.fromARGB(255, 207, 207, 207),
            onTap: () {
              forwardPopUp(context, requestId: requestId);
            },
          ),
          const SizedBox(width: 10),
          CustomButtonWithIcon(
            child: 'Reject All',
            textColor: Colors.black,
            bgColor: const Color(0xffF9F9F9),
            icon: Symbols.cancel,
            onHoverColor: const Color.fromARGB(255, 207, 207, 207),
            onTap: () {
              makeSureDialog(
                context,
                contentText: 'Are you want to reject all?',
                submitText: 'Yes, Reject it!',
                onSubmit: () {
                  BlocProvider.of<RequestDetailsCubit>(context)
                      .changeLogRequest(
                    ChangeRequestLogEntity(
                      requestTypeId: '',
                      requestId: requestId,
                      comment: '',
                      status: 5, //Reject
                      checkedAll: true, //All
                    ),
                  );
                  GoRouter.of(context).pop();
                },
              );
            },
          ),
          const SizedBox(width: 10),
          CustomButtonWithIcon(
            child: 'Approve All',
            textColor: Colors.black,
            bgColor: const Color(0xffF9F9F9),
            icon: Symbols.inventory,
            onHoverColor: const Color.fromARGB(255, 207, 207, 207),
            onTap: () {
              makeSureDialog(
                context,
                contentText: 'Are you want to approve all?',
                submitText: 'Yes, Approve it!',
                onSubmit: () {
                  BlocProvider.of<RequestDetailsCubit>(context)
                      .changeLogRequest(
                    ChangeRequestLogEntity(
                      requestTypeId: '',
                      requestId: requestId,
                      comment: '',
                      status: 7, //Approve
                      checkedAll: true, //All
                    ),
                  );
                  GoRouter.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> forwardPopUp(BuildContext context,
      {required String requestId}) {
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
          title: const PopUpHeadingTitle(headingText: "Forward Request"),
          content: ForwardedContentBody(
            forwardTextContent: 'Forward the request to concerned users',
            forwardResonController: forwardResonController,
            onSelectForwardUsers: (values) {
              usersId = values;
            },
          ),
          actions:
              popUpActions(context, submitBtnName: 'Forward', onSubmit: () {
            BlocProvider.of<ForwardedRequestCubit>(context).forwardUsers(
              id: requestId,
              forwardReason: forwardResonController.text,
              forwardedUsers: usersId,
            );
          }),
        );
      },
    );
  }
}

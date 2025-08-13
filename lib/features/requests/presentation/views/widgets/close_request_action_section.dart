import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/popup_actionds.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/requests/presentation/managers/close_request_cubit/close_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/close_request_content_body.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_heading_title.dart';

class CloseRequestActionSection extends StatelessWidget {
  const CloseRequestActionSection({
    super.key,
    required this.requestId,
  });
  final String requestId;
  @override
  Widget build(BuildContext context) {
    String finalResult = '';
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonWithIcon(
            child: 'Close',
            textColor: Colors.white,
            bgColor: const Color(0xff13C855),
            icon: Symbols.task_alt,
            onHoverColor: const Color.fromARGB(255, 12, 132, 56),
            onTap: () {
              showDialog(
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
                    title:
                        const PopUpHeadingTitle(headingText: "Close Request"),
                    content: CloseRequestContentBody(
                      onType: (value) {
                        finalResult = value;
                      },
                    ),
                    actions: popUpActions(
                      context,
                      submitBtnName: 'Submit',
                      onSubmit: () {
                        BlocProvider.of<CloseRequestCubit>(context)
                            .closeRequest(requestId, finalResult);
                        GoRouter.of(context).pop();
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/make_sure_dialog_body.dart';

Future<dynamic> makeSureDialog(
    BuildContext context, {
    required String contentText,
    required String submitText,
    required Function() onSubmit,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: Colors.white,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          content: MakeSureDialogBody(
            contentText: contentText,
            submitText: submitText,
            onSubmit: onSubmit,
          ),
        );
      },
    );
  }
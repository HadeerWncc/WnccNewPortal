import 'package:flutter/material.dart';

class ShowSnackbar {
  ShowSnackbar({Key? key});
  static void showSnackBar(
      BuildContext context, String message, String status) {
    Color bgcolor = Colors.black;
    Color fgcolor = Colors.white;
    if (status == "S") //Success
    {
      bgcolor = Colors.green;
    } else if (status == "F") //Failure
    {
      bgcolor = const Color.fromARGB(255, 131, 20, 12);
    } else if (status == "W") //warning
    {
      bgcolor = Colors.amber;
      fgcolor = Colors.black;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: fgcolor),
        ),
        backgroundColor: bgcolor,
      ),
    );
  }
}

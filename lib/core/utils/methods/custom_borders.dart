import 'package:flutter/material.dart';

OutlineInputBorder inputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 230, 229, 229),
      ),
      borderRadius: BorderRadius.circular(8));
}

OutlineInputBorder customfocusedBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      color: Color.fromARGB(255, 171, 171, 171),
    ),
  );
}

RoundedRectangleBorder drawerBorde() {
  return const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );
}

OutlineInputBorder changePassowrdInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    borderRadius: BorderRadius.circular(8),
  );
}

BorderSide tableBorderSide() =>
    const BorderSide(color: Color.fromARGB(255, 215, 215, 215));

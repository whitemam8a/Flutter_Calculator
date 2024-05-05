import 'package:flutter/material.dart';

Widget callButtons(String btnText, Color txtColor, double btnWidth,
    Color btnColor, void Function(String) buttonPressed) {
  return InkWell(
    onTap: () {
      buttonPressed(btnText);
    },
    child: Container(
      alignment: Alignment.center,
      height: 50,
      width: btnWidth,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(53)),
      child: Text(btnText,
          style: TextStyle(
              color: txtColor, fontSize: 30, fontWeight: FontWeight.w500)),
    ),
  );
}

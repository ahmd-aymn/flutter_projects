import 'package:flutter/material.dart';

class Elevbutton extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
  final void Function()? onPressed;
  const Elevbutton(
      {super.key,
      required this.label,
      required this.borderColor,
      required this.buttonColor,
      required this.textColor,
      required this.shadowColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [
        BoxShadow(
            color: shadowColor,
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2))
      ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(331, 52),
            backgroundColor: buttonColor,
            side: BorderSide(color: borderColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
                color: textColor, fontSize: 19, fontWeight: FontWeight.normal),
          )),
    );
  }
}

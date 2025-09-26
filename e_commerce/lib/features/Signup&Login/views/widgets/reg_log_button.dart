import 'package:flutter/material.dart';

class RegLogButton extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressed;
  const RegLogButton(
      {super.key,
      required this.label,
      required this.buttonColor,
      required this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 35),
          shadowColor: Colors.transparent,
          backgroundColor: buttonColor,
          side: BorderSide(color: Colors.transparent),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontFamily: 'LeagueSpartan',
                fontWeight: FontWeight.w500)));
  }
}

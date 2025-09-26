import 'package:flutter/material.dart';
import '../../../../core/widgets/start_elev_button.dart';

class MessageWithButton extends StatelessWidget {
  final String message;
  final Color? messageColor;
  final String buttonLabel;
  final void Function() onPressed;
  const MessageWithButton(
      {super.key,
      required this.message,
      this.messageColor,
      required this.onPressed,
      required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(message, style: TextStyle(color: messageColor)),
      SizedBox(height: 10),
      StartElevButton(
        label: buttonLabel,
        onPressed: onPressed,
      ),
    ]);
  }
}

import 'package:e_commerce/features/Signup&Login/views/widgets/reg_log_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_assets/app_colors.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(message, style: TextStyle(color: messageColor)),
      SizedBox(height: 10),
      Center(
          child: RegLogButton(
              label: buttonLabel,
              buttonColor: AppColors.orange,
              textColor: AppColors.white,
              onPressed: onPressed))
    ]);
  }
} /*RegLogButton(label: 'Sign Up', buttonColor: AppColors.orange, textColor: AppColors.white, onPressed: (){})*/

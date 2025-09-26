import 'package:flutter/material.dart';
import '../app_assets/AppColors.dart';
import 'MyElevatedButton.dart';

class StartElevButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const StartElevButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Elevbutton(
        label: label,
        borderColor: AppColors.green,
        buttonColor: AppColors.green,
        textColor: Colors.white,
        shadowColor: AppColors.green,
        onPressed: onPressed);
  }
}

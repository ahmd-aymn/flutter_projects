import 'package:flutter/material.dart';

import '../../../../core/app_assets/app_colors.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  final TextStyle? hintStyle;
  final Widget suffixIcon;
  final TextEditingController controller;
  const PasswordField(
      {super.key,
      required this.hint,
      this.hintStyle,
      required this.suffixIcon,
      required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  String realPassword = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Center(
            child: SizedBox(
              width: 260,
              height: 45,
              child: TextField(
                controller: widget.controller,
                obscureText: obscureText,
                obscuringCharacter: '*',
                style: TextStyle(color: AppColors.darkOrange, fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: widget.hintStyle,
                ),
                onChanged: (value) {
                  realPassword = value;
                },
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                  //widget.controller.text = realPassword;
                });
              },
              icon: widget.suffixIcon)
        ],
      ),
    );
  }
}

import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final String hint;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  const DefaultFormField(
      {super.key, required this.hint, this.hintStyle, this.controller});

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
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: hintStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

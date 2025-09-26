import 'package:flutter/material.dart';

import '../app_assets/app_colors.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  const BodyContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColors.white),
        child: child);
  }
}

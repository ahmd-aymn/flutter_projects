import 'package:flutter/material.dart';

import '../app_assets/AppColors.dart';

// ignore: must_be_immutable
class DefaultContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  Color bordercolor;
  DefaultContainer(
      {super.key,
      this.child,
      this.width = 331,
      this.height = 63,
      this.bordercolor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        padding: EdgeInsets.all(10),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: bordercolor)),
        child: child);
  }
}

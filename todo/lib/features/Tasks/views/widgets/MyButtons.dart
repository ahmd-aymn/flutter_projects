import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;
  final Color? color;
  final BoxBorder? border;
  final double radius;
  final double? width;
  final double? height;
  final Widget? child;
  const MyButtons(
      {super.key,
      this.margin,
      this.padding,
      this.icon,
      this.color,
      required this.radius,
      this.width,
      this.height,
      this.border,
      this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: border,
          color: color,
        ),
        child: child);
  }
}

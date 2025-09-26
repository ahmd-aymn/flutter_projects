import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_assets/app_colors.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final String icon;
  final void Function()? onTap;
  const ShowButton(
      {super.key, required this.label, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(label,
            style: TextStyle(
                color: AppColors.orange,
                fontFamily: 'LeagueSpartan',
                fontWeight: FontWeight.w600)),
        SizedBox(width: 10),
        SvgPicture.asset(icon),
        SizedBox(width: 10)
      ]),
    );
  }
}

import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckContainer extends StatelessWidget {
  final String label;
  final String icon;
  const CheckContainer({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 44,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 40),
          Expanded(child: Text(label, style: AppStyles.profileLabelStyle)),
          SvgPicture.asset(AppIcons.arrowForward)
        ],
      ),
    );
  }
}

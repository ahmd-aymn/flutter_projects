import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets/app_colors.dart';
import '../../../../core/app_assets/app_icons.dart';

class RateContainer extends StatelessWidget {
  final double rate;
  final Color? color;
  const RateContainer({super.key, required this.rate, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 14,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          SizedBox(width: 3),
          Text(rate.toString(),
              style: TextStyle(
                  color: AppColors.darkOrange,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 12)),
          SizedBox(width: 2),
          SvgPicture.asset(AppIcons.star)
        ],
      ),
    );
  }
}

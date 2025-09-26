import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemIcon extends StatefulWidget {
  final String icon;
  final String label;
  const ItemIcon({super.key, required this.icon, required this.label});

  @override
  State<ItemIcon> createState() => _ItemIconState();
}

class _ItemIconState extends State<ItemIcon> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            width: 49,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:
                  isTapped ? AppColors.lightOrange : AppColors.extraLightOrange,
            ),
            child: SvgPicture.asset(widget.icon),
          ),
        ),
        Text(widget.label, style: AppStyles.itemLabel)
      ],
    );
  }
}

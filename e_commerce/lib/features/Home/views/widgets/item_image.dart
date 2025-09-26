import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_icons.dart';
import 'package:e_commerce/features/Home/views/widgets/rate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemImage extends StatelessWidget {
  final String image;
  const ItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 150,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image))),
      ),
      Positioned(
          top: 10,
          left: 10,
          child: RateContainer(rate: 5.0, color: AppColors.white)),
      Positioned(
          top: 10,
          left: 50,
          child: Container(
            padding: EdgeInsets.all(2),
            width: 14,
            height: 14,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
            child: SvgPicture.asset(AppIcons.heart),
          ))
    ]);
  }
}

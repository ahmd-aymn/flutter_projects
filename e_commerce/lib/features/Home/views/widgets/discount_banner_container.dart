import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_assets/app_colors.dart';
import '../../../../core/app_assets/app_icons.dart';
import '../../../../core/app_assets/app_images.dart';

class DiscountBannerContainer extends StatelessWidget {
  const DiscountBannerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          height: 135,
          decoration: BoxDecoration(
              color: AppColors.orange, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 153,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text('  Experience our\ndelicious new dish',
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'LeagueSpartan')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('30% OFF',
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontFamily: 'LeagueSpartan')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset(AppIcons.ellipse12)],
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    AppImages.pizza,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(right: 167, child: SvgPicture.asset(AppIcons.ellipse13))
      ],
    );
  }
}

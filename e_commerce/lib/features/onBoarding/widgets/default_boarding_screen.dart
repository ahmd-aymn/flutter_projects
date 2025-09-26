import 'package:e_commerce/core/app_assets/app_colors.dart';
import 'package:e_commerce/core/app_assets/app_styles.dart';
import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/features/Signup&Login/views/start_view.dart';
import 'package:e_commerce/features/onBoarding/widgets/default_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/body_container.dart';

class DefaultBoardingView extends StatelessWidget {
  final List<Widget> skipButton;
  final String screenImage;
  final String icon;
  final String label;
  final String buttonLabel;
  final PageController pageController;
  const DefaultBoardingView(
      {super.key,
      required this.skipButton,
      required this.screenImage,
      required this.icon,
      required this.buttonLabel,
      required this.label,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: screenHeight,
                width: double.infinity,
                child: Image.asset(
                  screenImage,
                  fit: BoxFit.cover,
                )),
            Column(
              children: [
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: skipButton),
                SizedBox(height: screenHeight * (0.82 / 2)),
                BodyContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                          width: 50, height: 50, child: SvgPicture.asset(icon)),
                      SizedBox(height: 20),
                      Text(label, style: AppStyles.onBoardingLabelStyle),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, conse ctetur  \n  adipiscing elit, sed do eiusmod tempor \n  incididunt ut labore et dolore magna.',
                              style: AppStyles.onBoardingTextStyle),
                        ],
                      ),
                      SizedBox(height: 20),
                      DefaultDotsIndicator(
                          pageController: pageController, length: 3),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (pageController.page! < 2) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            myNavigator(context, screen: StartView());
                          }
                        },
                        child: Container(
                          width: 133,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: Text(
                            buttonLabel,
                            style: TextStyle(color: AppColors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

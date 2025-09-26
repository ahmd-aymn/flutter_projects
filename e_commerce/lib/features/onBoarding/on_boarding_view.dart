import 'package:e_commerce/core/helper/my_navigator.dart';
import 'package:e_commerce/core/widgets/show_button.dart';
import 'package:e_commerce/features/Signup&Login/views/start_view.dart';
import 'package:e_commerce/features/onBoarding/widgets/default_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../core/app_assets/app_icons.dart';
import '../../core/app_assets/app_images.dart';
import '../../core/app_assets/app_strings.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView for Screens
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              DefaultBoardingView(
                  skipButton: [
                    SizedBox(height: 10),
                    ShowButton(
                        label: 'Skip',
                        icon: AppIcons.arrowForward,
                        onTap: () {
                          myNavigator(context, screen: StartView());
                        })
                  ],
                  screenImage: AppImages.food_1,
                  icon: AppIcons.list,
                  buttonLabel: 'Next',
                  label: AppStrings.orderForFood,
                  pageController: pageController),
              DefaultBoardingView(
                  skipButton: [
                    SizedBox(height: 10),
                    ShowButton(
                        label: 'Skip',
                        icon: AppIcons.arrowForward,
                        onTap: () {
                          myNavigator(context, screen: StartView());
                        })
                  ],
                  screenImage: AppImages.food_2,
                  icon: AppIcons.visa,
                  buttonLabel: 'Next',
                  label: AppStrings.easyPayment,
                  pageController: pageController),
              DefaultBoardingView(
                  skipButton: [SizedBox(height: 20)],
                  screenImage: AppImages.food_3,
                  icon: AppIcons.delivery,
                  buttonLabel: 'Get Started',
                  label: AppStrings.fastDelivery,
                  pageController: pageController)
            ],
          ),
        ),
        //DefaultDotsIndicator(pageController: pageController)
        // Smooth Page Indicator
        /*Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SmoothPageIndicator(
            controller: pageController, // PageController
            count: screens.length, // Number of pages
            effect: WormEffect( // Choose your effect
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),*/
      ],
    );
  }
}
